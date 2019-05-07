$(function () {
    setInterval(function x() {
        $('#picture').fadeOut(3000, function () {
            switch ($('#picture').attr('src')) {
                case 'img/Carousel2.jpg':
                    $('#picture').attr('src', 'img/Carousel3.jpg');
                    break;
                default:
                    $('#picture').attr('src', 'img/Carousel2.jpg');
                    break;
                    $('#picture').fadeIn(3000);
            }
        });
        return x;
    }, 6000);
});
