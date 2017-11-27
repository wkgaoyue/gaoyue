from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse
from myweb.models import Types,Goods,Users,Orders,Detail
import time,json,math

def load():
	context={}
	context['type0list']=Types.objects.filter(pid=0)
	return context

# 商城首页
def shopindex(request):
    context=load()
    return render(request,"myweb/shopindex.html",context)

# 商城商品列表页
def shoplist(request):
	context=load()

	list = Goods.objects.filter()
	if request.GET.get('tid','') != '':
		tid=str(request.GET.get('tid',''))
		list=list.filter(typeid__in=Types.objects.only('id').filter(path__contains=','+tid+','))
	context['goodslist'] =list 
	return render(request,"myweb/shoplist.html",context)

# 商城商品详情页
def detail(request,gid=0):
	context=load()
	ob = Goods.objects.get(id=gid)
	ob.clicknum +=1
	ob.save()
	context["goods"]=ob
	return render(request,"myweb/detail.html",context)
#商城登录界面
def login(request):
	return render(request,"myweb/login.html")

def dologin(request):
	try:
		user=Users.objects.get(username=request.POST['username'])

		if user.state ==1:
			import hashlib
			m = hashlib.md5() 
			m.update(bytes(request.POST['password'],encoding="utf8"))
			if user.password == m.hexdigest():
				request.session['vipuser']=user.upDict();

				return redirect(reverse('shopindex'))
			else:
				context={'info':'登录密码错误'}
		else:
			context={'info':'此用户未注册'}
	except:
		context={'info':'登录账号错误！'}
	return render(request,"myweb/login.html",context)
def logout(request):
    # 清除登录的session信息
    del request.session['vipuser']
    # 跳转登录页面（url地址改变）
    return redirect(reverse('login'))
    # 加载登录页面(url地址不变)
    #return render(request,"myadmin/login.html")

def register(request):
	return render(request,"myweb/register.html")

def logadd(request):
	try:
	    ob = Users()
	    ob.username = request.POST['username']
	    ob.name = '请输入昵称'
	    #获取密码并md5
	    import hashlib
	    m = hashlib.md5() 
	    m.update(bytes(request.POST['password'],encoding="utf8"))
	    ob.password = m.hexdigest()
	    ob.sex = 1
	    ob.address = '全国各地'
	    ob.code = 0
	    ob.phone = 0
	    ob.email = '12334'
	    ob.state = 1
	    ob.addtime = time.time()
	    ob.save()
	    context = {'info':'添加成功！'}
	except:
	    context = {'info':'添加失败！'}

	return render(request,"myweb/register.html",context)

def shopcart(request):
	context = load()
	if 'shoplist' not in request.session:
		request.session['shoplist']={}

	return render(request,"myweb/shopcart.html",context)

def shopcartadd(request):
    #获取要添加的购物车信息
    goods=Goods.objects.get(id=request.POST['id'])
    shop=goods.toDict();
    shop['m']=int(request.POST['m'])
    #获取原购物车中的信息
    if 'shoplist' in request.session:
        shoplist = request.session['shoplist']
    else:
        shoplist = {}

    #判断并放置到session中
    if goods.id in shoplist:
        shoplist[goods.id]['m'] += shop['m'] #若购物车中已包含要购买的商品，就将购买量加1，
    else:
        shoplist[goods.id] = shop  # 若不存在则将当前商品直接放入购物车shoplist中

    #将购物车信息shoplist放入到session中
    request.session['shoplist'] = shoplist
    return redirect(reverse('shopcart'))
 
def shopcartshow(request):
    return render(request,"myweb/shopcart.html")
def shopcartdel(request,gid):
	#获取购物车中的商品
	shoplist = request.session['shoplist']
	#删除对应的商品
	del shoplist[gid]
	#放回购物车到session中
	request.session['shoplist']=shoplist
	return redirect(reverse('shopcartshow'))

def shopclear(request):
	context=load()
	request.session['shoplist']={}
	return render(request,"myweb/shopcart.html",context)

def shopcartchange(request):
	context=load()
	shoplist =request.session['shoplist']
	shopid = request.GET['sid']
	num = int(request.GET['num'])
	if num<1:
		num = 1
	shoplist[shopid]['m'] = num
	request.session['shoplist'] = shoplist
	return redirect(reverse('shopcart'))






def shoporders(request):

    return render(request,'myweb/shoporder.html')


#=========订单处理=======
def orderform(request):
	ids = request.GET.get('gids','')
	if ids == '':
		return HttpResponse("请选择要结账商品")
	gids = ids.split(',')
	shoplist = request.session['shoplist']
	orderlist={}
	total = 0
	for sid in gids:
		orderlist[sid]=shoplist[sid]
		total += shoplist[sid]['price']*shoplist[sid]['m']
	request.session['orderlist']=orderlist
	request.session['total']=total
	return render(request,"myweb/shoporder.html")
def orderconfirm(request):
	return render(request,"myweb/orderconfirm.html")
def orderconfirm1(request):
	return render(request,"myweb/orderconfirm1.html")

def orderinfo(request):
	return 	render(request,"myweb/orderinfo.html")
def orderinsert(request):
	orders =Orders()
	orders.uid =request.session['vipuser']['id']
	orders.linkman = request.POST['linkman']
	orders.address = request.POST['address']
	orders.code = request.POST['code']
	orders.phone = request.POST['phone']
	orders.addtime=time.time()
	orders.total = request.session['total']
	orders.status = 0
	orders.save()
	orderlist = request.session['orderlist']
	shoplist = request.session['shoplist']
	for shop in orderlist.values():
		del shoplist[str(shop['id'])]
		detail = Detail()
		detail.orderid = orders.id
		detail.goodsid = shop['id']
		detail.name = shop['goods']
		detail.price = shop['price']
		detail.num = shop['m']
		detail.save()
	del request.session['orderlist']
	del request.session['total']
	request.session['shoplist']=shoplist
	return render(request,"myweb/shoporder.html")







    





