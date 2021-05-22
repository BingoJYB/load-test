-- example HTTP POST script which demonstrates setting the
-- HTTP method, body, and adding a header
--  ./wrk -t2 -c2 -R10 -d1s -s ~/Desktop/resolve_v1_new.lua https://test.cws.digital.accenture.com/api/v1/coba_resources/7/resolve

counter = 0

function getRandom()
    selection = math.random(1, 100000)
    return tostring(selection)
end

request = function()
    wrk.headers["Content-Type"] = "application/json"
	wrk.headers["Authorization"] = "Token 8231956e7b024fbf29e5445f56e2619ab6fc567a"
    wrk.body = '{"configuration_string": "SA_15U,SA_243,SA_258,SA_270,SA_286,SA_287,SA_292,SA_'..getRandom()..',SA_2U5,SA_310,SA_345,SA_351,SA_362,SA_411,SA_428,SA_440,SA_475,SA_485,SA_504,SA_51U,SA_543,SA_545,SA_580,SA_620,SA_70B,SA_7U3,SA_808,SA_873,SA_893,SA_969,SA_998,SA_B18,SA_B59,SA_H23,SA_L3E,SA_P34,SA_R01,SA_R11,SA_U10,SA_U54,SA_U59,SA_U62,SA_V50,177087", "layer_type" : ["all"], "mjaj": 0}'
	return wrk.format("POST", wrk.path, wrk.headers, wrk.body)
end

response = function(status, headers, body)
    if status == 200 then
        counter = counter + 1
    else
        print(status, body)
    end
    return wrk.format(counter)
end
