from django.conf.urls import url
from . import views
urlpatterns = [
	url(r'^shopindex$', views.shopindex,name='shopindex'), #  商城首页
	url(r'^shoplist$', views.shoplist,name='shoplist'), #  商城列表页
	url(r'^detail/(?P<gid>[0-9]+)$', views.detail,name='detail'), #  商城详情页

	url(r'^login$',views.login,name='login'),
	url(r'^dologin$',views.dologin,name='dologin'),
	url(r'^logout$',views.logout,name='logout'),
	url(r'^logadd$',views.logadd,name='logadd'),
	url(r'^register$',views.register,name='register'),

	url(r'^shopcart$',views.shopcart,name='shopcart'),
	url(r'^shopcartadd$',views.shopcartadd,name='shopcartadd'),
	url(r'^shopcartshow$',views.shopcartshow,name='shopcartshow'),
	url(r'^shopcartdel/(?P<gid>[0-9]+)$',views.shopcartdel,name='shopcartdel'),
	url(r'^shopcartchange$',views.shopcartchange,name="shopcartchange"),



	url(r'^shopclear$',views.shopclear,name='shopclear'),

	url(r'^orderform$',views.orderform,name='orderform'),
	url(r'^orderinfo$',views.orderinfo,name='orderinfo'),
	url(r'^orderconfirm$',views.orderconfirm,name='orderconfirm'),
	url(r'^orderconfirm1$',views.orderconfirm1,name='orderconfirm1'),
	url(r'^orderinsert$',views.orderinsert,name='orderinsert'),	
]
