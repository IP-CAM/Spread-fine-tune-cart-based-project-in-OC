(function (util) {

    util.PAGE_SIZE = 25;
    util.MAX_BUBBLE = 5;
    util.rangeData = [];

    util.range = function (start, end) {
        var arr = [];

        if (!end) {
            end = start;
            start = 0;
        }

        for (var i = start; i < end; i++)
            arr.push(i);

        return arr;
    };

    util.Pager = function (data) {

        var self = this;
        var _size = util.PAGE_SIZE;
        var rangeData = [];

        self.current = 0;

        self.content = function (index) {
            var start = index * self.size,
                end = (index * self.size + self.size) > data.length
                    ? data.length
                    : (index * self.size + self.size);

            return data.slice(start, end);
        };

        self.next = function () {
            if (!self.canPage('Next')) return;
            self.current++;
        };

        self.prev = function () {
            if (!self.canPage('Prev')) return;
            self.current--;
        };

        self.canPage = function (dir) {
            if (dir === 'Next') return self.current < self.count - 1;
            if (dir === 'Prev') return self.current > 0;
            return false;
        };

        self.list = function () {
            if(rangeData.length  > 0 &&  rangeData.indexOf(self.current) != -1)
                return rangeData;
            var start=0, end = self.count > util.MAX_BUBBLE ? util.MAX_BUBBLE : self.count;
            if(rangeData.length > 0)
            {
                if(rangeData[0] > self.current)
                {
                    start = rangeData[0] - 1;
                }
                else
                {
                    start = rangeData[0] + 1;
                }


                end = start + util.MAX_BUBBLE;
            }
            rangeData = Util.range(start, end);
            return rangeData;
        };

        Object.defineProperty(self, 'size', {
            configurable: false,
            enumerable: false,
            get: function () { return _size; },
            set: function (val) {
                _size = val || _size;
            }
        });

        Object.defineProperty(self, 'count', {
            configurable: false,
            enumerable: false,
            get: function () {
                return Math.ceil(data.length / self.size);
            }
        });
    };

})(window.Util = window.Util || {});