local util = util;
module('relative');

function Get()
	return util.RelativePathToFull("."):sub(1, -2);
end;