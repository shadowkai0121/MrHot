//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MrHot.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public string fOrderGuid { get; set; }
        public Nullable<System.DateTime> fOrderDate { get; set; }
        public Nullable<System.DateTime> fOrderTransportDate { get; set; }
        public Nullable<int> fOrderTotalPrice { get; set; }
        public string fMemberUserID { get; set; }
        public string fMemberName { get; set; }
        public string fOrderReceiverName { get; set; }
        public string fOrderContactPhone { get; set; }
        public string fOrderReceiverAddress { get; set; }
    }
}
