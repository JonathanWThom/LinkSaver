# frozen_string_literal: true

class UserAgent
  LIST = [
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) ApL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) Ap (KHTML, like Gecko) Version/12.1 Safari/605.1.15",
    "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) ApL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) ApML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebL, like Gecko) Chrome/74.0.3729.108 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101 Firefox/60.0",
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebL, like Gecko) Chrome/72.0.3626.121 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36L, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) ApL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) ApML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) ApKHTML, like Gecko) Version/12.0.3 Safari/605.1.15",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) ApML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0",
    "Mozilla/5.0 (X11; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebrome/71.0.3578.98 Safari/537.36 OPR/58.0.3135.132",
    "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebrome/71.0.3578.98 Safari/537.36 OPR/58.0.3135.127",
    "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/53L, like Gecko) Chrome/68.0.3440.106 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebL, like Gecko) Chrome/74.0.3729.131 Safari/537.36",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36ML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) Ap (KHTML, like Gecko) Version/12.1 Safari/605.1.15",
    "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) ApL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0",
    "Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5121 YaBrowser/19.3.2.177 Yowser/2.5 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) ApL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14) Appl (KHTML, like Gecko) Version/12.0 Safari/605.1.15",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) ApL, like Gecko) Chrome/74.0.3729.108 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0",
    "Mozilla/5.0 (iPad; CPU OS 12_2 like Mac OS X) Applke Gecko) Version/12.1 Mobile/15E148 Safari/604.1",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36um/73.0.3683.86 Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) ApML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebML, like Gecko) Chrome/73.0.3683.75 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/586 YaBrowser/19.4.0.2397 Yowser/2.5 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36L, like Gecko) Chrome/51.0.2704.106 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) ApL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) ApML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) ApL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36L, like Gecko) Chrome/74.0.3729.108 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5121 YaBrowser/19.3.1.887 Yowser/2.5 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKL, like Gecko) Chrome/72.0.3626.121 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0) Gecko/20100101 Firefox/67.0",
    "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) ApKHTML, like Gecko) Version/12.0.2 Safari/605.1.15",
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKL, like Gecko) Chrome/74.0.3729.108 Safari/537.36",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36ML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5L, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36ML, like Gecko) Chrome/70.0.3538.77 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36ML, like Gecko) Chrome/73.0.3683.75 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:66.0) Gecko/20100101 Firefox/66.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) Ap (KHTML, like Gecko) Version/12.1 Safari/605.1.15",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) ApL, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299",
    "Mozilla/5.0 (Windows NT 5.1; rv:52.0) Gecko/20100101 Firefox/52.0",
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKrome/71.0.3578.98 Safari/537.36 OPR/58.0.3135.127",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) ApKHTML, like Gecko) Version/12.0.1 Safari/605.1.15",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebL, like Gecko) Chrome/72.0.3626.109 Safari/537.36",
    "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:65.0) Gecko/20100101 Firefox/65.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) ApKHTML, like Gecko) Version/11.1.2 Safari/605.1.15",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) ApML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0",
    "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:56.0) Gecko/20100101 Firefox/56.0",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36um/73.0.3683.75 Chrome/73.0.3683.75 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) ApL, like Gecko) Chrome/72.0.3626.121 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5rome/71.0.3578.98 Safari/537.36 OPR/58.0.3135.127",
    "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53121 YaBrowser/19.3.2.177 Yowser/2.5 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53L, like Gecko) Chrome/73.0.3683.103 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0) Gecko/20100101 Firefox/65.0",
    "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5ML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0"
  ].freeze

  def run
    { "User-Agent" => LIST.sample }
  end
end
