// force to use c++11
#if __cplusplus < 201101
#error "Require c++11 or later"
#endif

#include <string>

class string

// returns substr [pos, pos + count)
// if count is too large, returns [pos, size()).
string substr(size_type pos=0, size_type count=npos) const;

// enable conversion to int
operator int() const { ... }
