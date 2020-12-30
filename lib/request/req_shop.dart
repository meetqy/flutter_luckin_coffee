import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ReqShop {
  ///Dio 可以用来做http 请求
  Dio _dio;

  ReqShop(this._dio);

  /// 商品列表
  Future<Response> goodsList({
    /// 排序规则：
    /// priceUp 商品升序，
    /// priceDown 商品倒序，
    /// ordersUp 销量升序，
    /// ordersDown 销量降序，
    /// addedUp 发布时间升序，
    /// addedDown 发布时间倒序
    String orderBy = 'ordersDown',

    /// 获取第几页数据
    int page = 1,

    /// 每页显示多少数据
    int pageSize = 3,

    /// -1 全部状态 0 上架 1 下架
    int status = 0,
  }) {
    return _dio.post('/shop/goods/list', queryParameters: {
      "orderBy": orderBy,
      "page": page,
      "pageSize": pageSize,
      "status": status,
    });
  }

  /// 商品类别
  Future<Response> goodsCategoryAll() {
    return _dio.post('/shop/goods/category/all');
  }

  /// 商品详情
  Future<Response> goodsDetail(
      {

      /// 商品id
      @required int id}) {
    return _dio.post('/shop/goods/detail', queryParameters: {'id': id});
  }

  /// 获取商品价格
  Future<Response> goodsPrice({
    /// 商品id
    @required int goodsId,

    /// 选择的规格尺寸信息：如：4:15,2:10,1:4 。
    /// 多个规格请用英文的逗号分割，4:15 中的 4 获取代表颜色，15 或许代表 土豪金
    @required String propertyChildIds,
  }) {
    return _dio.post('/shop/goods/price', queryParameters: {
      "goodsId": goodsId,
      "propertyChildIds": propertyChildIds,
    });
  }
}
