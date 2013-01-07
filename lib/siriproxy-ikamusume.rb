require 'shellwords'

class SiriProxy::Plugin::Ikamusume < SiriProxy::Plugin

  attr_accessor :ikamusume

  def initialize(config = {})
    self.ikamusume = File.join(File.dirname(__FILE__), 'ikamusume.pl')
  end

  filter "AddViews", direction: :from_guzzoni do |object|
    object["properties"]["views"].each do |view|
      if view["properties"].key? "speakableText"
        stext = view["properties"]["speakableText"]
        sret = `#{self.ikamusume} #{stext.shellescape}`
        view["properties"]["speakableText"] = sret
        text = view["properties"]["text"]
        ret = `#{self.ikamusume} #{text.shellescape}`
        view["properties"]["text"] = ret
      end
    end
    object
  end

end
