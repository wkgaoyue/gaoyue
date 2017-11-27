from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse

from myadmin.models import Orders,Detail,Goods
from PIL import Image
import time,json,os


# 浏览商品类别信息
def ordersindex(request):
    # 执行数据查询，并放置到模板中
    context={}
    # list = Orders.objects.extra(select = {'_has':'concat(uid,id)'}).order_by('_has')
    orders = Orders.objects.filter(uid=request.session['vipuser']['id'])
    # 遍历查询结果，为每个结果对象追加一个pname属性，目的用于缩进标题
    for order in orders:
        detailother = Detail.objects.filter(orderid=order.id)
        order.detailall=detailother
        for detail in detailother :
            goods=Goods.objects.get(id=detail.goodsid)
            detail.picname=goods.picname
    context['orderslist']= orders
    return render(request,'myadmin/order/index.html',context)


def ordergoods(request,oid):
    ob =Orders.objects.get(id=oid)
    # list = Detail.objects.extra(select = {'_has':'concat(orderid)'}).order_by('_has')
    context = {"order":ob}
    return render(request,'myadmin/order/ordergoods.html',context)
def detailupdate(request):
    try:
        ob = Orders.objects.get(id= request.POST['id'])
        a=ob.code
        print(a)

        ob.status=request.POST['status']
        ob.save()
        context = {'info':'修改成功！'}
    except:
        context = {'info':'修改失败！'}
    return render(request,"myadmin/info.html",context)