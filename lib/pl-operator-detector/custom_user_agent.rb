# encoding: utf-8
class PlOperatorDetector
  class CustomUserAgent

    BROWSERS  = %w(Opera Chrome Firefox IE)
    PLATFORMS = ["Windows NT 6.0", "Windows XP", "X11", "Macintosh"]
    ENGINES   = ["AppleWebKit/537.36 (KHTML, like Gecko)", "Webkit"]
    VENDOR    = ["Mozilla", "Opera"]

    class << self

      def get_user_agent
        "#{VENDOR[rand(VENDOR.size)]}/#{random_version} (#{PLATFORMS[rand(PLATFORMS.size)]}) #{ENGINES[rand(ENGINES.size)]} #{BROWSERS[rand(BROWSERS.size)]}/#{random_version}"
      end

      def random_version
        (1+rand(2)).times.map {|x| (1+rand(20*(x+1))).round(1) }.join('.')
      end

    end

  end
end