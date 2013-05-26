# -*- coding: utf-8 -*-

Plugin.create(:midare_midare) do

  def translate_midare_midare(str)
    if m = str.match(/.+の(.+)$/) and not str =~ /\#/
      str + " #" + m[1]
    else
      str
    end
  end

  command(:midare_midare,
          name: '〜の乱れ #乱れ',
          condition: lambda{ |opt| true },
          visible: true,
          role: :postbox) do |opt|
    Plugin.create(:gtk).widgetof(opt.widget).widget_post.buffer.text = translate_midare_midare(Plugin.create(:gtk).widgetof(opt.widget).widget_post.buffer.text)
  end

  settings ('〜の乱れ #乱れ') do
    boolean '自動で「〜の乱れ #乱れ」する', :midare_midare_automode end
  

  filter_gui_postbox_post do |gui_postbox|
    if UserConfig[:midare_midare_automode]
      Plugin.create(:gtk).widgetof(gui_postbox).widget_post.buffer.text = translate_midare_midare(Plugin.create(:gtk).widgetof(gui_postbox).widget_post.buffer.text)
    end

    [gui_postbox]
  end

end

