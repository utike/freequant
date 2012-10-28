#include <sstream>
#include <utility>
#include <vector>

#include <boost/algorithm/string.hpp>
#include <boost/lexical_cast.hpp>
#include <boost/uuid/uuid.hpp>
#include <boost/uuid/uuid_generators.hpp>
#include <boost/uuid/uuid_io.hpp>

#include "Utility.h"

using namespace std;

namespace FreeQuant {

string toGuidString() {
    boost::uuids::uuid u = boost::uuids::random_generator()();
    stringstream ss;
    ss << u;
    return ss.str();
}

string toGuidString1() {
    boost::uuids::uuid u = boost::uuids::random_generator()();
    return boost::lexical_cast<std::string>(u);
}

map<string, string> parseParamsFromString(const string& str) {
    vector<string> parts;
    boost::split(parts, str, boost::is_any_of(";"), boost::token_compress_on);
    map<string, string> params;
    struct func {
        pair<string, string> operator()(string& part) const {
            vector<string> p;
            boost::split(p, part, boost::is_any_of("="), boost::token_compress_on);
            return make_pair(p[0], p[1]);
        }
    };
    transform(parts.begin(), parts.end(), inserter(params, params.end()), func());
    return params;
}

}
