<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <title>极客密室 | ${user.company.name} | ${user.name}</title>

    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="stylesheet" href="css/light7.min.css">
    <link rel="stylesheet" href="css/geak.css">
    <script type="text/javascript">
      var USER = {"id":"${user.id}", "name":"${user.name}" };
      var COMPANY = {"id":"${user.company.id}", "name":"${user.company.name}" };
    </script>
  </head>
  <body>
    <!-- page 容器 -->
    <div id="page_list" class="page page-current">
      <!-- 标题栏 -->
      <header class="bar bar-nav">
        <button id="btn_refresh" class="button button-link button-nav pull-left">
          <span class="icon icon-refresh"></span> 刷新
        </button>
        <button id="btn_create" class="button button-link button-nav pull-right">
          新建 <span class="icon icon-right"></span>
        </button>
        <h1 class="title">近期预约</h1>
      </header>

      <!-- 工具栏 -->
      <nav class="bar bar-tab">
        <a class="external tab-item active" href="#">
          <span class="icon icon-edit"></span>
          <span class="tab-label">预约</span>
        </a>
        <a class="external tab-item" href="orders.html?page=orders">
          <span class="icon icon-emoji"></span>
          <span class="tab-label">接待</span>
        </a>
      </nav>

      <!-- 这里是页面内容区 -->
      <div class="content pull-to-refresh-content infinite-scroll">
        <div class="pull-to-refresh-layer">
          <div class="preloader"></div>
          <div class="pull-to-refresh-arrow"></div>
        </div><!-- /.pull-to-refresh-layer -->
        <div class="list-block cards-list">
          <ul id="list"></ul>
        </div><!-- /.cards-list -->
        <div class="infinite-scroll-preloader">
          <div class="preloader" style="display:none;"></div>
          <a id="btn_more" class="button button-round">加载更多过往预约数据...</a>
        </div><!-- /.infinite-scroll-preloader -->
      </div><!-- /.content -->
    </div><!-- /.page -->

    <div id="page_detail" class="page">
      <header class="bar bar-nav">
        <button id="btn_back" class="button button-link button-nav pull-left">
          <span class="icon icon-left"></span> 返回
        </button>
        <button id="btn_save" class="button button-primary button-nav pull-right"> 保存 </button>
        <h1 class="title">预约详情</h1>
      </header>
      <div class="content">
        <input id="item_id" type="hidden" />
        <input id="item_state" type="hidden" />
        <div class="content-block-title color-primary">预约玩家信息</div>
        <div class="list-block">
          <ul>
            <li>
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-title label">玩家姓名</div>
                  <div class="item-input">
                    <input id="item_customer_name" type="text"  />
                  </div>
                  <div class="item-input">
                    <select id="item_customer_sex">
                      <option value="M">先生</option>
                      <option value="F">女士</option>
                    </select>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-title label">预约人数</div>
                  <div class="item-input">
                    <input id="item_customer_count" type="text" />
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-title label">联系方式</div>
                  <div class="item-input">
                    <input id="item_customer_tele" type="text"/>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div><!-- /.list-block -->
        <div class="content-block-title color-primary">预约时间及主题</div>
        <div class="list-block">
          <ul>
            <li>
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-title label">预约时间</div>
                  <div class="item-input">
                    <input id="item_datetime" type="text" />
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-title label color-success">到场时间</div>
                  <div class="item-input">
                    <input id="item_confirmed_datetime" type="text" readonly="readonly" />
                  </div>
                </div>
              </div>
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-title label color-danger">取消时间</div>
                  <div class="item-input">
                    <input id="item_cancelled_datetime" type="text" readonly="readonly" />
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
        <div class="list-block">
          <ul id="list_business"></ul>
        </div>
        <div class="content-block-title color-primary">相关预约信息</div>
        <div class="list-block">
          <ul id="list_relate">
            <li class="item-content">
              <div class="item-inner"><div class="item-title color-danger">暂无相关预约</div></div>
            </li>
          </ul>
        </div><!-- /.list-block -->
      </div><!-- /.content-block -->
    </div><!-- /.page page-detail -->
    
    <script type="text/x-tmpl" id="tmpl_card">
      {% for (var i=0; i<o.length; i++) { %}
        {% include('tmpl_card_item', o[i]); %}
      {% } %}
    </script>
    <script type="text/x-tmpl" id="tmpl_card_item">
      <li id="card_{%= o.id %}" class="card" data-id="{%= o.id %}" data-datetime="{%= o.datetime %}">
        <div class="card-header">
          <label class="item-title">{%= moment(new Date(o.datetime)).format("MM月DD日 HH:mm") %}</label>
          <label class="item-after item-business">{%= o.businesses[0].alias %}
            {% for (var j=1; j<o.businesses.length; j++) { %}
              &amp; {%= o.businesses[j].alias %}
            {% } %}
          </label>
        </div>
        <div class="card-content">
          <div class="card-content-inner row">
            <div class="col-80 item-name">
              {%= o.customer.name %}  
              {% if (o.customer.sex == 'M')print('先生'); else print('女士'); %}
              ({%= o.customer.telephone %}) 
            </div>
            <div class="col-20" style="text-align:right;"><b>{%= o.customerCount %}</b> 人</div>
          </div>
        </div>
        <div class="card-footer">
          {% if (o.state == 'NEW') { %}
              <label class="item-title color-warning">待确认</label>
              <button class="button button-warning button-fill item-after" data-id="{%= o.id %}">
                确认到场</button>
          {% } %}
          {% if (o.state == 'CONFIRMED') { %}
              <label class="item-title color-success">已到场：
                {%= moment(new Date(o.confirmedDatetime)).format("MM月DD日 HH:mm") %}
              </label>
          {% } %}
          {% if (o.state == 'CANCELLED') { %}
              <label class="item-title color-danger">已取消：
                {%= moment(new Date(o.cancelledDatetime)).format("MM月DD日 HH:mm") %}
              </label>
          {% } %}
        </div>
      </li>
    </script>
    <script type="text/x-tmpl" id="tmpl_business">
      {% for (var i=0; i<o.length; i++) { %}
        {% if (i%2 == 0) { %}
          {% if (i > 0) { %}
        </li>{% } %} 
        <li class="row">
        {% } %}
          <div class="col-50"> 
            <div class="item-content">
              <div class="item-inner">
                <label class="item-title">{%= o[i].alias %}</label>
                <label class="item-after label-switch">                    
                  <input id="_b_{%= o[i].id %}" type="checkbox" value="{%= o[i].id %}" data-alias="{%= o[i].alias %}" />
                  <div class="checkbox"></div>
                </label>
              </div>
            </div>
          </div>
      {% } %}
        </li>
    </script>
    <script type="text/x-tmpl" id="tmpl_relate">
      {% if(o.length == 0) { %}
        <li class="item-content">
          <div class="item-inner"><div class="item-title color-danger">暂无相关预约</div></div>
        </li>
      {% } else { %}
        {% for (var i=0; i<o.length; i++) { %}
          <li class="item-content">
            <div class="item-inner">
              <div class="item-title">
                <b class="color-primary">{%= moment(new Date(o[i].datetime)).format("HH:mm") %}</b>
                <span>{%= o[i].customer.name %} 
                  {% if (o[i].customer.sex == 'M')print('先生'); else print('女士'); %}
                </span>
              </div>
              <div class="item-after">{%= o[i].businesses[0].alias %}
                {% for (var j=1; j<o[i].businesses.length; j++) { %}
                  &amp; {%= o[i].businesses[j].alias %}
                {% } %}
              </div>
            </div>
          </li>
        {% } %}
      {% } %}
    </script>

    <!-- 你的html代码 -->
    <script type='text/javascript' src='js/jquery.min.js'></script>
    <script type='text/javascript' src='js/light7.min.js'></script>
    <script type='text/javascript' src='js/moment.min.js'></script>
    <script type='text/javascript' src='js/tmpl.min.js'></script>
    <script type='text/javascript' src='js/json2.min.js'></script>
    <script type='text/javascript' src='js/geak.js'></script>
  </body>
</html>







