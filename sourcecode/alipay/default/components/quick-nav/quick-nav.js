const app = getApp();
Component({
  data: {
    popup_status: false,
    quick_status: 0,
    data_list: [],
    system: null,
    x: 0,
    y: 0,
  },

  // 页面被展示
  didMount() {
    // 配置初始化
    this.init_config();

    // 数据设置
    var system = app.get_system_info();
    this.setData({
      system: system,
      x: 5,
      y: (system.windowHeight || 450)-160,
    });
  },
  methods: {
    // 初始化配置
    init_config(status) {
      if((status || false) == true) {
        this.setData({
          data_list: app.get_config('quick_nav') || [],
          quick_status: app.get_config('config.home_navigation_main_quick_status') || 0
        });
      } else {
        app.is_config(this, 'init_config');
      }
    },

    // 弹层开启
    quick_open_event(e) {
      this.setData({popup_status: true, data_list: app.get_config('quick_nav') || []});
    },

    // 弹层关闭
    quick_close_event(e) {
      this.setData({ popup_status: false });
    },

    // 操作事件
    navigation_event(e) {
      app.operation_event(e);
    },
  },
});
