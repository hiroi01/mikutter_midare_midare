# -*- coding: utf-8 -*-

Plugin.create(:midare_midare) do

  command(:midare_midare,
          name: '〜の乱れ #乱れ',
          condition: lambda{ |opt| true },
          visible: true,
          role: :postbox) do |opt|
    str = Plugin.create(:gtk).widgetof(opt.widget).widget_post.buffer.text
	if m = str.match(/.+の(.+)$/)
		Plugin.create(:gtk).widgetof(opt.widget).widget_post.buffer.text = str + " #" + m[1]
    end
  end

end

