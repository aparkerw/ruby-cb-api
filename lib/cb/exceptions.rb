module Cb
  class IncomingParamIsWrongTypeException < StandardError; end
  class ExpectedResponseFieldMissing      < StandardError; end
  class ApiResponseError                  < StandardError; end
  class SiteDown                          < StandardError; end
end
