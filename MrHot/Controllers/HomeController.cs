using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MrHot.Models;

namespace MrHot.Controllers
{
    public class HomeController : Controller
    {
        MrHotEntities2 db = new MrHotEntities2();

        // GET: Home
        public ActionResult Index()
        {
            if (Session["Member"] == null)
            { return View("Index", "_Layout"); }

            return View("Index", "_LayoutMember");
        }

        public ActionResult Introduction()
        {
            if (Session["Member"] == null)
            { return View("Introduction", "_Layout"); }

            return View("Introduction", "_LayoutMember");
        }

        public ActionResult Where()
        {
            if (Session["Member"] == null)
            { return View("Where", "_Layout"); }

            return View("Where", "_LayoutMember");
        }

        #region 會員系統
        // Get: Home/Login
        public ActionResult Login()
        {
            if (Session["Member"] == null)
            { return View("Login", "_Layout"); }

            return View("Login", "_LayoutMember");
        }

        [HttpPost]
        public ActionResult Login(string fMemberUserID, string fMemberPassword)
        {
            // 登入帳號密碼比對
            var member = db.Members
                .Where(m => m.fMemberUserID == fMemberUserID && m.fMemberPassword == fMemberPassword)
                .FirstOrDefault();

            if (member == null)
            {
                ViewBag.Message = "帳號或密碼輸入錯誤。";
                return View();
            }

            //登入成功
            Session["Member"] = member;
            return RedirectToAction("Products");
        }

        // Get: Home/Register
        public ActionResult Register()
        {
            if (Session["Member"] == null)
            { return View("Register", "_Layout"); }

            return View("Register", "_LayoutMember");
        }

        [HttpPost]
        public ActionResult Register(Member NewMember)
        {
            if (ModelState.IsValid == false)
            { return View(); }

            // 確認帳號未被註冊
            var member = db.Members
                .Where(m => m.fMemberUserID == NewMember.fMemberUserID)
                .FirstOrDefault();

            if (member == null)
            {
                db.Members.Add(NewMember);
                db.SaveChanges();
                return RedirectToAction("Products");
            }
            ViewBag.Message = "帳號已經被註冊。";
            return View();
        }

        // Get: Home/Logout
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }
        #endregion /會員系統

        #region 購物車系統
        //Get: Home/Products
        public ActionResult Products()
        {
            var Products = db.Products.ToList();
            if (Session["Member"] == null)
            { return View("Products", "_Layout", Products); }

            return View("Products", "_LayoutMember", Products);
        }

        //Get:Home/ShoppingCar
        public ActionResult ShoppingCar()
        {
            if (Session["Member"] == null)
            { return View("Login", "_Layout"); }

            // 取得會員帳號
            string fMemberUserID = (Session["Member"] as Member).fMemberUserID;

            // 找出購物車內容
            var orderDetails = db.OrderDetails
                .Where(o => o.fMemberUserID == fMemberUserID && o.fIsApproved == "否")
                .ToList();
            return View("ShoppingCar", "_LayoutMember", orderDetails);
        }

        [HttpPost]
        public ActionResult ShoppingCar(string CustomerName, string CustomerPhone, string CustomerAddress, int fOrderTotalPrice)
        {
            string fUserId = (Session["Member"] as Member).fMemberUserID;

            // 建立訂單編號
            string guid = Guid.NewGuid().ToString();

            // 建立訂單物件
            Order newOrder = new Order();
            newOrder.fOrderGuid = guid;
            newOrder.fMemberUserID = fUserId;
            newOrder.fOrderTotalPrice = fOrderTotalPrice;
            newOrder.fOrderReceiverName = CustomerAddress;
            newOrder.fOrderContactPhone = CustomerPhone;
            newOrder.fOrderReceiverAddress = CustomerAddress;
            newOrder.fOrderDate = DateTime.Now;
            db.Orders.Add(newOrder);

            var carList = db.OrderDetails
                 .Where(m => m.fIsApproved == "否" && m.fMemberUserID == fUserId)
                 .ToList();

            foreach (var item in carList)
            {
                item.fOrderGuid = guid;
                item.fIsApproved = "是";
            }
            db.SaveChanges();
            return RedirectToAction("OrderList");
        }

        // Get: Products/addCar
        public ActionResult addCar(int fProductID)
        {
            if (Session["Member"] == null)
            {               
                return RedirectToAction("Login");
            }
            // 取得會員帳號並指定給 fUserId
            string fUserId = (Session["Member"] as Member).fMemberUserID;

            // 找出放入訂單明細的產品，該產品的fIsApproved == "否" 代表該產品是購物車狀態
            var currentCar = db.OrderDetails
                .Where(o => o.fProductID == fProductID && o.fIsApproved == "否")
                .FirstOrDefault();

            // 如果currentCar等於null，表示會員選購的產品沒有在購物車內
            if (currentCar == null)
            {
                // 找出選購的產品並指定給product
                var product = db.Products
                    .Where(o => o.fProductID == fProductID)
                    .FirstOrDefault();

                // 建立新的明細
                OrderDetail newOrder = new OrderDetail();
                newOrder.fMemberUserID = fUserId;
                newOrder.fProductID = fProductID;
                newOrder.fProductName = product.fProductName;
                newOrder.fOrderDetailUnitePrice = product.fProductUnitPrice;
                newOrder.fOrderDetailQuantity = 1;
                newOrder.fIsApproved = "否";
                db.OrderDetails.Add(newOrder);
                ViewBag.message = "加入購物車成功！";
            }
            else
            {
                currentCar.fOrderDetailQuantity += 1;
            }
            db.SaveChanges();
            return RedirectToAction("Products");
        }

        public ActionResult DeleteCar(int fProductID)
        {
            var OrderDetail = db.OrderDetails
                .Where(o => o.fProductID == fProductID && o.fIsApproved == "否")
                .FirstOrDefault();

            db.OrderDetails.Remove(OrderDetail);
            db.SaveChanges();
            return RedirectToAction("ShoppingCar");
        }

        public ActionResult AmountControl(int fProductID, int fCommand)
        {
            var OrderDetail = db.OrderDetails
               .Where(o => o.fProductID == fProductID && o.fIsApproved == "否")
               .FirstOrDefault();

            OrderDetail.fOrderDetailQuantity += fCommand;
            db.SaveChanges();

            return RedirectToAction("ShoppingCar");
        }
        #endregion /購物車系統

        #region 訂單查詢系統
        // GET: Home/OrderList
        public ActionResult OrderList()
        {
            if (Session["Member"] == null)
            { return View("Login", "_Layout"); }
            string fUserID = (Session["Member"] as Member).fMemberUserID;

            var OrderList = db.Orders
                .Where(o => o.fMemberUserID == fUserID)
                .ToList();
            return View("OrderList", "_LayoutMember", OrderList);
        }

        public ActionResult OrderDetail(string guid)
        {
            if (Session["Member"] == null)
            { return View("Login", "_Layout"); }
            string fUserID = (Session["Member"] as Member).fMemberUserID;

            var OrderDetails = db.OrderDetails
                .Where(o => o.fOrderGuid == guid && o.fMemberUserID == fUserID)
                .ToList();
            return View("OrderDetail", "_LayoutMember",OrderDetails);
        }
        #endregion
    }
}