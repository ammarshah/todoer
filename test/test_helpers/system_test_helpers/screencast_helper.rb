require "fileutils"
require "base64"

module ScreencastHelper
  extend ActiveSupport::Concern

  included do
    setup :start_screencast
    teardown :stop_screencast
  end

  private

  def start_screencast
    @frames = []

    # Grab the underlying Ferrum page instance from Cuprite
    ferrum_page = page.driver.browser.page

    # Read docs for more options: https://docs.rubycdp.com/docs/ferrum/screencast
    ferrum_page.start_screencast(format: :jpeg, quality: 80) do |data|
      @frames << data
    end
  end

  def stop_screencast
    page.driver.browser.page.stop_screencast rescue nil

    if !passed? && @frames.any?
      generate_screencast_video
    end
  end

  def generate_screencast_video
    screencast_dir = Rails.root.join("tmp/screencasts")
    FileUtils.mkdir_p(screencast_dir)
    video_path = "#{screencast_dir}/failures_#{name}.mp4"
    ffmpeg_command = "ffmpeg -loglevel error -y -f image2pipe -vcodec mjpeg -i - -vcodec libx264 -pix_fmt yuv420p #{video_path} 2>/dev/null"

    # Feed the gathered JPEG frames into FFmpeg to generate an MP4 video
    IO.popen(ffmpeg_command, "wb") do |pipe|
      @frames.each do |base64_frame|
        pipe.write(Base64.decode64(base64_frame))
      end
    end

    puts "[Screencast Video]: #{video_path}"
  end
end
