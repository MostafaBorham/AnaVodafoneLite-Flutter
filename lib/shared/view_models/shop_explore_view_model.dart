abstract class ShopExploreViewModel{
  double webProgress=0;
  bool canBack=false;
  final double maxProgress=1;
  abstract final String webUrl;
  ShopExploreViewModel();

  setWebProgress(int progress){
    webProgress=progress/100;
  }
  setCanBack(bool canBack){
    this.canBack=canBack;
  }
}