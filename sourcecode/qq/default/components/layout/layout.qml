<block qq:if="{{(propData || null) != null && propData.length > 0}}">
  <block qq:for="{{propData}}" qq:key="key" qq:for-item="v">
    <view qq:if="{{(v.value || null) != null && (v.children || null) != null && v.children.length > 0 && (v.value_arr || null) != null && v.value_arr.length > 0 && v.children.length == v.value_arr.length && (v.status || 0) == 1}}" class="layout-view">
      <view class="layout-content-children {{((v.config || null) != null && (v.config.frontend_config || null) != null && (v.config.frontend_config.ent || null) != null) ? v.config.frontend_config.ent : ''}}" style="{{((v.config || null) != null && (v.config.frontend_config || null) != null && (v.config.frontend_config.style || null) != null) ? v.config.frontend_config.style : ''}}">
        <block qq:for="{{v.children}}" qq:key="keys" qq:for-item="vs">
          <view class="layout-content-container {{((vs.config || null) != null && (vs.config.frontend_config || null) != null && (vs.config.frontend_config.ent || null) != null) ? vs.config.frontend_config.ent : ''}}" style="{{((vs.config || null) != null && (vs.config.frontend_config || null) != null && (vs.config.frontend_config.style || null) != null) ? vs.config.frontend_config.style : ''}}">
            <block qq:if="{{(vs.children || null) != null && vs.children.length > 0}}">
              <view qq:for="{{vs.children}}" qq:key="keyss" qq:for-item="vss" class="layout-content">
                <view qq:if="{{(vss.config || null) != null}}" class="module-content">
                  <view class="module-{{vss.value}}-container" style="{{((vss.config.frontend_config || null) != null && (vss.config.frontend_config.style || null) != null) ? vss.config.frontend_config.style : ''}}">
                    <!-- 单图 -->
                    <block qq:if="{{vss.value == 'images'}}">
                      <view class="module-images-content {{vss.config.frontend_config.media_fixed.media_container_ent}}" style="{{vss.config.frontend_config.media_fixed.media_container_style}}">
                        <image bindtap="layout_url_event" data-value="{{vss.config.url || ''}}" src="{{vss.config.images}}" mode="widthFix" class="{{vss.config.frontend_config.media_fixed.media_ent}}"></image>
                      </view>
                    </block>

                    <!-- 多图 -->
                    <block qq:elif="{{vss.value == 'many-images'}}">
                      <block qq:if="{{vss.config.view_list_show_style == 'rolling'}}">
                        <!-- 滚动 -->
                        <view class="module-list-rolling">
                          <scroll-view scroll-x>
                            <view qq:for="{{vss.config.data_list}}" qq:key="ik" class="item">
                              <view class="module-item {{vss.config.frontend_config.media_fixed.media_container_ent}}" style="width:{{((vss.config.view_list_show_style_value_arr || null) == null || (vss.config.view_list_show_style_value_arr.item_width || null) == null) ? 200 : vss.config.view_list_show_style_value_arr.item_width}}px;margin-left:{{((vss.config.view_list_show_style_value_arr || null) == null || (vss.config.view_list_show_style_value_arr.item_margin || null) == null || index == 0) ? 0 : vss.config.view_list_show_style_value_arr.item_margin}}px;{{vss.config.frontend_config.item_style}}{{vss.config.frontend_config.media_fixed.media_container_style}}" bindtap="layout_url_event" data-value="{{item.url || ''}}">
                                <image src="{{item.images}}" mode="widthFix" class="{{vss.config.frontend_config.media_fixed.media_ent}}"></image>
                              </view>
                            </view>
                          </scroll-view>
                        </view>
                      </block>
                      <block qq:elif="{{vss.config.view_list_show_style == 'list'}}">
                        <!-- 列表 -->
                        <view class="module-list-content {{vss.config.frontend_config.list_ent}}">
                          <view qq:for="{{vss.config.data_list}}" qq:key="ik" class="item">
                            <view class="module-item" style="{{vss.config.frontend_config.item_style}}">
                              <view class="{{vss.config.frontend_config.media_fixed.media_container_ent}}" style="{{vss.config.frontend_config.media_fixed.media_container_style}}" bindtap="layout_url_event" data-value="{{item.url || ''}}">
                                <image src="{{item.images}}" mode="widthFix" class="{{vss.config.frontend_config.media_fixed.media_ent}}"></image>
                              </view>
                            </view>
                          </view>
                        </view>
                      </block>
                      <block qq:else>
                        <!-- 默认轮播 -->
                        <swiper
                          indicator-dots="{{vss.config.data_list.length > 0}}"
                          indicator-color="{{indicator_color}}"
                          indicator-active-color="{{indicator_active_color}}"
                          autoplay="{{vss.config.data_list.length > 0}}"
                          circular="{{circular}}" style="{{vss.config.frontend_config.media_fixed.media_container_style}}">
                          <block qq:for="{{vss.config.data_list}}" qq:key="ik">
                            <swiper-item class="{{vss.config.frontend_config.media_fixed.media_container_ent}}">
                              <image src="{{item.images}}" mode="aspectFill" class="{{vss.config.frontend_config.media_fixed.media_ent}}" bindtap="layout_url_event" data-value="{{item.url || ''}}"></image>
                            </swiper-item>
                          </block>
                        </swiper>
                      </block>
                    </block>

                    <!-- 视频 -->
                    <block qq:elif="{{vss.value == 'video'}}">
                      <view class="module-video-content {{vss.config.frontend_config.media_fixed.media_container_ent}}" style="{{vss.config.frontend_config.media_fixed.media_container_style}}">
                        <video src="{{vss.config.video}}" autoplay="{{false}}" show-center-play-btn="{{true}}" controls="{{false}}" show-play-btn="{{false}}" enable-progress-gesture="{{false}}" show-fullscreen-btn="{{false}}" controls poster="{{(vss.config.content_images || null) != null ? vss.config.content_images : ''}}" class="{{vss.config.frontend_config.media_fixed.media_ent}}"></video>
                      </view>
                    </block>

                    <!-- 商品 -->
                    <block qq:elif="{{vss.value == 'goods'}}">
                      <block qq:if="{{(vss.config.data_list || null) != null && vss.config.data_list.length > 0}}">
                        <block qq:if="{{vss.config.view_list_show_style == 'rolling'}}">
                          <!-- 滚动 -->
                          <view class="module-goods-content module-list-rolling">
                            <scroll-view scroll-x>
                              <view qq:for="{{vss.config.data_list}}" qq:key="ik" class="item">
                                <view class="module-item {{vss.config.frontend_config.media_fixed.media_container_ent}}" style="width:{{((vss.config.view_list_show_style_value_arr || null) == null || (vss.config.view_list_show_style_value_arr.item_width || null) == null) ? 200 : vss.config.view_list_show_style_value_arr.item_width}}px;margin-left:{{((vss.config.view_list_show_style_value_arr || null) == null || (vss.config.view_list_show_style_value_arr.item_margin || null) == null || index == 0) ? 0 : vss.config.view_list_show_style_value_arr.item_margin}}px;{{vss.config.frontend_config.item_style}}{{vss.config.frontend_config.media_fixed.media_container_style}}" bindtap="layout_url_event" data-value="{{item.goods_url || ''}}">
                                  <image src="{{item.images}}" mode="widthFix" class="{{vss.config.frontend_config.media_fixed.media_ent}}"></image>
                                  <view class="item-bottom">
                                    <view class="module-title">{{item.title}}</view>
                                    <view class="module-price">{{currency_symbol}}{{item.price}}</view>
                                  </view>
                                </view>
                              </view>
                            </scroll-view>
                          </view>
                        </block>
                        <block qq:else>
                          <!-- 默认列表 -->
                          <view class="module-goods-content module-list-content {{vss.config.frontend_config.list_ent}}">
                            <view qq:for="{{vss.config.data_list}}" qq:key="ik" class="item">
                              <view class="module-item" style="{{vss.config.frontend_config.item_style}}">
                                <view class="{{vss.config.frontend_config.media_fixed.media_container_ent}}" style="{{vss.config.frontend_config.media_fixed.media_container_style}}" bindtap="layout_url_event" data-value="{{item.goods_url || ''}}">
                                  <image src="{{item.images}}" mode="widthFix" class="{{vss.config.frontend_config.media_fixed.media_ent}}"></image>
                                  <view class="item-bottom">
                                    <view class="module-title">{{item.title}}</view>
                                    <view class="module-price">{{currency_symbol}}{{item.price}}</view>
                                  </view>
                                </view>
                              </view>
                            </view>
                          </view>
                        </block>
                      </block>
                    </block>

                    <!-- 标题 -->
                    <block qq:elif="{{vss.value == 'title'}}">
                      <view class="module-title-content">
                        <text class="title-main" style="{{vss.config.frontend_config.style_title_main}}">{{vss.config.title}}</text>
                        <text qq:if="{{(vss.config.title_vice || null) != null}}" class="title-vice" style="{{vss.config.frontend_config.style_title_vice}}">{{vss.config.title_vice}}</text>
                        <view qq:if="{{(vss.config.title_more || null) != null}}" class="more-content">
                          <view style="{{vss.config.frontend_config.style_title_more}}" bindtap="layout_url_event" data-value="{{vss.config.title_more_url || ''}}">{{vss.config.title_more}} ></view>
                        </view>
                      </view>
                    </block>
                  </view>
                </view>
              </view>
            </block>
          </view>
        </block>
      </view>
    </view>
  </block>
</block>
