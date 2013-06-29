# encoding: utf-8
class PlOperatorDetector
  class OperatorName

    PATTERNS = {
      play: [ /^P4/, /^Play/ ],
      orange: [ /^Orange/ ],
      tmobile: [ /^PTC/, /^T-Mobile/ ],
      plus: [ /^Plus/ ],
      heyah: [ /^T-Mobile \(Heyah\)/, /^Heyah/ ],
      red_bull_mobile: [],  # unable to identify, ex. 790666666
      cyfrowy_polsat: [ /^Cyfrowy Polsat/ ],
      m_pay: [], # unable to identify
      novum: [], # unable to identify
      w_rodzinie: [ /^CenterNet/ ],
      carrefour_mova: [], # unable to identify
      tu_biedronka: [],
      fm_group_mobile: [],
      lycamobile: [],
      vectone: [],
      mbank_mobile: [],
      snickers_mobile: [],
      netia_mobile: [],
      virgin_mobile: [] # unable to identify (using P4)
    }

    class << self
      def normalize(input)
        @result = nil
        PATTERNS.each do |k, v|
          v.each do |pattern|
            if input =~ pattern
              @result = k
              break
            end
          end
          break if @result
        end
        @result
      end
    end

  end
end