class RecipeListBean {
  int? status;
  String? message;
  RecipeListData? data;
  int? page;
  int? dataCount;
  int? allPage;
  int? total;
  int? limit;

  RecipeListBean(
      {this.status,
      this.message,
      this.data,
      this.page,
      this.dataCount,
      this.allPage,
      this.total,
      this.limit});

  RecipeListBean.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new RecipeListData.fromJson(json['data']) : null;
    page = json['page'];
    dataCount = json['dataCount'];
    allPage = json['allPage'];
    total = json['total'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['page'] = this.page;
    data['dataCount'] = this.dataCount;
    data['allPage'] = this.allPage;
    data['total'] = this.total;
    data['limit'] = this.limit;
    return data;
  }
}

class RecipeListData {
  int? total;
  int? page;
  int? limit;
  int? allpages;
  List<RecipeRows>? rows;

  RecipeListData({this.total, this.page, this.limit, this.allpages, this.rows});

  RecipeListData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    allpages = json['allpages'];
    if (json['rows'] != null) {
      rows = <RecipeRows>[];
      json['rows'].forEach((v) {
        rows!.add(new RecipeRows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['allpages'] = this.allpages;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecipeRows {
  String? networkType;
  String? recipeId;
  String? providerId;
  String? recipeCode;
  String? recipeName;
  String? recipeType;
  String? smallLandscape;
  String? recipeContent;
  int? isMwsx;
  int? isShow;
  int? isBooking;
  int? recipePrice;
  String? ybUserType;
  String? ybUserId;
  String? ybUserName;
  String? ybUserImage;
  String? recipePeople;
  String? degree;
  String? taste;
  int? energy;
  int? protein;
  int? axunge;
  int? carbohydrate;
  int? cholesterol;
  int? timeRange;
  int? likeCount;
  int? lookCount;
  int? replyCount;
  int? shareCount;
  int? favoriteCount;
  String? recipeStatus;
  int? recipeVersion;
  int? isOffline;
  String? createTime;
  String? lastUpdate;
  int? isDel;
  String? releaseTime;
  String? exportTime;
  int? isLike;
  int? favoriteType;
  int? isShopping;
  int? isSynch;
  String? imageVertical;
  String? smallVertical;
  String? highVertical;
  String? chefId;
  String? chefText;
  String? chefTitle;
  String? cuisineId;
  String? chefIcon;
  String? modelId;
  String? productName;
  int? isNew;
  int? baseLikeCount;
  int? baseShareCount;
  int? baseFavoriteCount;
  int? cookingType;
  int? isYgdc;
  int? prCount;
  int? staticsCount;
  int? doCount;
  String? componentType;
  String? tjValue;
  String? crmModelName;
  String? modelTypeId;

  RecipeRows({
    this.networkType,
    this.recipeId,
    this.providerId,
    this.recipeCode,
    this.recipeName,
    this.recipeType,
    this.smallLandscape,
    this.recipeContent,
    this.isMwsx,
    this.isShow,
    this.isBooking,
    this.recipePrice,
    this.ybUserType,
    this.ybUserId,
    this.ybUserName,
    this.ybUserImage,
    this.recipePeople,
    this.degree,
    this.taste,
    this.energy,
    this.protein,
    this.axunge,
    this.carbohydrate,
    this.cholesterol,
    this.timeRange,
    this.likeCount,
    this.lookCount,
    this.replyCount,
    this.shareCount,
    this.favoriteCount,
    this.recipeStatus,
    this.recipeVersion,
    this.isOffline,
    this.createTime,
    this.lastUpdate,
    this.isDel,
    this.releaseTime,
    this.exportTime,
    this.isLike,
    this.favoriteType,
    this.isShopping,
    this.isSynch,
    this.imageVertical,
    this.smallVertical,
    this.highVertical,
    this.chefId,
    this.chefText,
    this.chefTitle,
    this.cuisineId,
    this.chefIcon,
    this.modelId,
    this.productName,
    this.isNew,
    this.baseLikeCount,
    this.baseShareCount,
    this.baseFavoriteCount,
    this.cookingType,
    this.isYgdc,
    this.prCount,
    this.staticsCount,
    this.doCount,
    this.componentType,
    this.tjValue,
    this.crmModelName,
    this.modelTypeId,
  });

  RecipeRows.fromJson(Map<String, dynamic> json) {
    networkType = json['networkType'];
    recipeId = json['recipeId'];
    providerId = json['providerId'];
    recipeCode = json['recipeCode'];
    recipeName = json['recipeName'];
    recipeType = json['recipeType'];
    smallLandscape = json['smallLandscape'];
    recipeContent = json['recipeContent'];
    isMwsx = json['isMwsx'];
    isShow = json['isShow'];
    isBooking = json['isBooking'];
    recipePrice = json['recipePrice'];
    ybUserType = json['ybUserType'];
    ybUserId = json['ybUserId'];
    ybUserName = json['ybUserName'];
    ybUserImage = json['ybUserImage'];
    recipePeople = json['recipePeople'];
    degree = json['degree'];
    taste = json['taste'];
    energy = json['energy'];
    protein = json['protein'];
    axunge = json['axunge'];
    carbohydrate = json['carbohydrate'];
    cholesterol = json['cholesterol'];
    timeRange = json['timeRange'];
    likeCount = json['likeCount'];
    lookCount = json['lookCount'];
    replyCount = json['replyCount'];
    shareCount = json['shareCount'];
    favoriteCount = json['favoriteCount'];
    recipeStatus = json['recipeStatus'];
    recipeVersion = json['recipeVersion'];
    isOffline = json['isOffline'];
    createTime = json['createTime'];
    lastUpdate = json['lastUpdate'];
    isDel = json['isDel'];
    releaseTime = json['releaseTime'];
    exportTime = json['exportTime'];
    isLike = json['isLike'];
    favoriteType = json['favoriteType'];
    isShopping = json['isShopping'];
    isSynch = json['isSynch'];
    imageVertical = json['imageVertical'];
    smallVertical = json['smallVertical'];
    highVertical = json['highVertical'];
    chefId = json['chefId'];
    chefText = json['chefText'];
    chefTitle = json['chefTitle'];
    cuisineId = json['cuisineId'];
    chefIcon = json['chefIcon'];
    modelId = json['modelId'];
    productName = json['productName'];
    isNew = json['isNew'];
    baseLikeCount = json['baseLikeCount'];
    baseShareCount = json['baseShareCount'];
    baseFavoriteCount = json['baseFavoriteCount'];
    cookingType = json['cookingType'];
    isYgdc = json['isYgdc'];
    prCount = json['prCount'];
    staticsCount = json['staticsCount'];
    doCount = json['doCount'];
    componentType = json['componentType'];
    tjValue = json['tjValue'];
    crmModelName = json['crmModelName'];
    modelTypeId = json['modelTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['networkType'] = this.networkType;
    data['recipeId'] = this.recipeId;
    data['providerId'] = this.providerId;
    data['recipeCode'] = this.recipeCode;
    data['recipeName'] = this.recipeName;
    data['recipeType'] = this.recipeType;
    data['smallLandscape'] = this.smallLandscape;
    data['recipeContent'] = this.recipeContent;
    data['isMwsx'] = this.isMwsx;
    data['isShow'] = this.isShow;
    data['isBooking'] = this.isBooking;
    data['recipePrice'] = this.recipePrice;
    data['ybUserType'] = this.ybUserType;
    data['ybUserId'] = this.ybUserId;
    data['ybUserName'] = this.ybUserName;
    data['ybUserImage'] = this.ybUserImage;
    data['recipePeople'] = this.recipePeople;
    data['degree'] = this.degree;
    data['taste'] = this.taste;
    data['energy'] = this.energy;
    data['protein'] = this.protein;
    data['axunge'] = this.axunge;
    data['carbohydrate'] = this.carbohydrate;
    data['cholesterol'] = this.cholesterol;
    data['timeRange'] = this.timeRange;
    data['likeCount'] = this.likeCount;
    data['lookCount'] = this.lookCount;
    data['replyCount'] = this.replyCount;
    data['shareCount'] = this.shareCount;
    data['favoriteCount'] = this.favoriteCount;
    data['recipeStatus'] = this.recipeStatus;
    data['recipeVersion'] = this.recipeVersion;
    data['isOffline'] = this.isOffline;
    data['createTime'] = this.createTime;
    data['lastUpdate'] = this.lastUpdate;
    data['isDel'] = this.isDel;
    data['releaseTime'] = this.releaseTime;
    data['exportTime'] = this.exportTime;
    data['isLike'] = this.isLike;
    data['favoriteType'] = this.favoriteType;
    data['isShopping'] = this.isShopping;
    data['isSynch'] = this.isSynch;
    data['imageVertical'] = this.imageVertical;
    data['smallVertical'] = this.smallVertical;
    data['highVertical'] = this.highVertical;
    data['chefId'] = this.chefId;
    data['chefText'] = this.chefText;
    data['chefTitle'] = this.chefTitle;
    data['cuisineId'] = this.cuisineId;
    data['chefIcon'] = this.chefIcon;
    data['modelId'] = this.modelId;
    data['productName'] = this.productName;
    data['isNew'] = this.isNew;
    data['baseLikeCount'] = this.baseLikeCount;
    data['baseShareCount'] = this.baseShareCount;
    data['baseFavoriteCount'] = this.baseFavoriteCount;
    data['cookingType'] = this.cookingType;
    data['isYgdc'] = this.isYgdc;
    data['prCount'] = this.prCount;
    data['staticsCount'] = this.staticsCount;
    data['doCount'] = this.doCount;
    data['componentType'] = this.componentType;
    data['tjValue'] = this.tjValue;
    data['crmModelName'] = this.crmModelName;
    data['modelTypeId'] = this.modelTypeId;
    return data;
  }
}
