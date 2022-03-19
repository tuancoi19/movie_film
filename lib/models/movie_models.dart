import 'package:movie_film/models/actor_models.dart';

class ItemPopular {
  int ID;
  String name;
  String urlPhoto;
  String releaseDate;
  String urlBG;
  String genre;
  String overView;
  ItemPopular({required this.ID, required this.name, required this.urlPhoto, required this.releaseDate, required this.urlBG, required this.genre, required this.overView});

  searchCast (int id) {
    List<ItemCast> listCast = [];
    for (ItemCast i in listItemCast) {
      if (id == i.ID) {
        listCast.add(i);
      }
    }
    return listCast;
  }
}

final List<ItemPopular> listItemPopular = [
  ItemPopular(
    ID: 1,
    name: "RAYA và rồng thần cuối cùng",
    urlPhoto: "assets/images/1.jpg",
    releaseDate: "05-T3-2021",
    urlBG: "assets/images/bg1.jpg",
    genre: "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Giả Tưởng, Phim Gia Đình, Phim Hành Động",
    overView: "Raya Và Rồng Thần Cuối Cùng kể về vương quốc Kumandra - nơi loài người và loài rồng sống hòa thuận với nhau. Khi một đại dịch tên là Druun kéo đến, loài rồng đã hy sinh, tạo ra một viên Ngọc Rồng để bảo vệ con người. Con người trở nên thù địch, tranh giành quyền sở hữu Ngọc Rồng. Một sự kiện đã khiến viên ngọc bị vỡ ra làm nhiều mảnh, mỗi vùng đất đều tranh lấy để giữ kín, đại dịch Druun lại tràn ra đẩy Kumandra xuống bờ vực hoang tàn. Raya - nàng công chúa của mảnh đất Long Tâm quyết tâm lên đường tìm kiếm ngọc thần để hồi sinh lại người cha của mình."
  ),
  ItemPopular(
    ID: 2,
    name: "Tom và Jerry: Quậy tung New York",
    urlPhoto: "assets/images/2.jpeg",
    releaseDate: "26-T2-2021",
    urlBG: "assets/images/bg2.jpg",
    genre: "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Gia Đình, Phim Hài",
    overView: "Chú chuột Jerry đang trú ngụ tại khách sạn Royal sang trọng nơi mà sắp sửa sẽ tổ chức đám cưới cho một cặp đôi nổi tiếng. Cô nhân viên mới Kayla được giám đốc giao cho nhiệm vụ đuổi Jerry đi nên đã mang về chú mèo Tom vốn có ba đời kinh nghiệm đối phó với lũ chuột. Từ đây, cuộc chiến thế kỷ không hồi kết giữa Tom và Jerry lại tiếp diễn, mang đến nhiều tình huống oái oăm cho khách sạn sang chảnh New York và những con người ở đây."
  ),
  ItemPopular(
    ID: 3,
    name: "Chaos Walking",
    urlPhoto: "assets/images/3.jpg",
    releaseDate: "05-T3-2021",
    urlBG: "assets/images/bg3.jpg",
    genre: "Phim Giật Gân, Phim Phiêu Lưu, Phim Giả Tưởng, Phim Hành Động",
    overView: "Chaos Walking là câu chuyện về một tương lai xa xôi ở một nơi được gọi là Tân Thế Giới, nơi những người phụ nữ đã bị giết hại và đàn ông sống cô độc với một thứ dịch bệnh kì lạ khiến mọi suy nghĩ trong đầu họ bị hiện rõ ra ngoài - được gọi là Nhiễu. Cậu thiếu niên tên Todd Hewitt - người mất mẹ và sống với cha nuôi luôn gặp khó khăn với việc kiểm soát Nhiễu của mình, điều này khiến cậu trở nên kích động và khó hòa nhập với xã hội mới. Một ngày, trong lúc đang làm trên cánh đồng, Todd tình cờ phát hiện cô gái tên Viola - cô gái đầu tiên cậu được biết. Viola không có Nhiễu và đến từ một con tàu thám hiểm ngoài không gian của con người, mang đến cơ hội giúp những kẻ sống sót trên hành tinh có thể thoát khỏi nơi này. Thị trưởng David Prentiss mong muốn có được Viola tuy nhiên linh tính mách bảo Todd nên giữ cho cô gái an toàn tránh khỏi ông ta, cuộc hành trình trốn chạy của Todd và Viola chính thức bắt đầu."
  ),
  ItemPopular(
    ID: 4,
    name: "Fear of Rain",
    urlPhoto: "assets/images/4.jpg",
    releaseDate: "12-T2-2021",
    urlBG: "assets/images/bg4.jpg",
    genre: "Phim Giật Gân, Phim Tâm Lý, Phim Chính Kịch",
    overView: "Bộ phim kể về thiếu niên Rain Burroughs (Madison Iseman) hiện đang phải sống chung với chứng bệnh tâm thần phân liệt, bị ảo giác cả thính giác lẫn thị giác. Cô ngưng uống thuốc và có một cảnh tượng kinh hoàng đã xảy ra, đó chính là có ai đó đã xông vào, cưỡng chế và đẩy cô xuống hố. Cô tỉnh lại trên giường bệnh với sự lo lắng của cha mẹ cô (Katherine Heigl và Harry Connick Jr.) đang đứng bên cạnh giường bệnh. Rain đồng ý việc uống thuốc trở lại, nhưng mọi thứ ngay lập tức rẽ sang hướng khác khi cô bắt đầu nghi ngờ rằng giáo viên và người hàng xóm kế bên là Ms. McConnell (Eugenie Bondurant) hiện đang giữ một đứa bé gái làm con tin. Người duy nhất tin rằng Rain đang nói sự thật là một đứa trẻ mới chuyển tới trường tên là  Caleb (Israel Broussard), và họ đã cùng nhau quyết định điều tra vụ việc. Nhưng thật không may, cô ấy không thể xác định được liệu điều mà cô đang nghi hoặc có thật hay là không."
  ),
  ItemPopular(
    ID: 5,
    name: "Judas and the Black Messiah",
    urlPhoto: "assets/images/5.jpg",
    releaseDate: "12-T2-2021",
    urlBG: "assets/images/bg5.jpg",
    genre: "Phim Chính Kịch, Phim Lịch Sử, Phim Tội Phạm, Phim Hư Cấu Lịch Sử",
    overView: "Judas and the Black Messiah là một bộ phim chính kịch tiểu sử sắp ra mắt của Mỹ kể về nhà hoạt động cách mạng Fred Hampton và Black Panther Party (Đảng Báo đen) trong những năm 1960. Đảng Báo đen là một tổ chức cách mạng được thành lập bởi các sinh viên đại học. Hoạt động cốt lõi của Đảng Black Panther là tuần tra công khai vũ trang để theo dõi hành vi của các sĩ quan ở sở cảnh sát Oakland và thách thức sự tàn bạo của cảnh sát trong thành phố."
  ),
  ItemPopular(
    ID: 6,
    name: "Nomadland",
    urlPhoto: "assets/images/6.jpg",
    releaseDate: "19-T2-2021",
    urlBG: "assets/images/bg6.jpg",
    genre: "Phim Chính Kịch, Phim Độc Lập, Phim Viễn Tây",
    overView: "Fern là một người phụ nữ 60 tuổi nhưng có cuộc sống rất chông chênh khi cô vừa mất đi tất cả trong một biến cố tại nơi cô sinh sống. Bỏ lại mọi thứ đằng sau, cô quyết định sống cuộc sống du mục, chu du qua nhiều vùng đất mới trên chiếc xe RV của mình. Trong chuyến hành trình này, cô gặp rất nhiều người bạn mới cũng như chiêm nghiệm được nhiều thứ giúp cô hiểu thêm về ý nghĩa của cuộc sống."
  )
];


