module ColorUtils
  FORMAT = /^rgb\((?<r>\d|\d\d|(?:0|1)\d\d|2[0-5]{2}),(?<g>\d|\d\d|(?:0|1)\d\d|2[0-5]{2}),(?<b>\d|\d\d|(?:0|1)\d\d|2[0-5]{2})\)$/

  module WCAG2
    module Contrast
      def aa_compliant?
        self >= 4.5
      end

      def aa_large_text_compliant?
        self >= 3.0
      end

      def aaa_compliant?
        self >= 7.0
      end

      def aaa_large_text_compliant?
        self >= 4.5
      end
    end
  end

  def contrast_ratio(color1, color2)
    check_color(color1)
    check_color(color2)

    l1 = relative_luminance(color1)
    l2 = relative_luminance(color2)

    l = (l1 + 0.05) / (l2 + 0.05)
    l = 1.0 / l if (l1 < l2)
    l.extend(WCAG2::Contrast)
  end

  private
    def check_color(color)
      raise ArgumentError, "Color #{color} is invalid" unless FORMAT.match(color)
    end

    def relative_luminance(color)
      r, g, b = rgb(color)
      0.2126 * r + 0.7152 * g + 0.0722 * b
    end

    def rgb(color)
      FORMAT.match(color).captures.collect do |c|
        c_sRGB = c.to_f / 255.0
        c_sRGB <= 0.03928 ? c_sRGB / 12.92 : ((c_sRGB + 0.055) / 1.055) ** 2.4
      end
    end
end


class Test
  include(ColorUtils)
end

r = Test.new.contrast_ratio("rgb(0,255,0)", "rgb(114,51,51)")
puts r, r.aa_compliant?, r.aa_large_text_compliant?, r.aaa_compliant?, r.aaa_large_text_compliant?