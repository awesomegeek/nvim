local M = {}


function M.get_prayer_times(opts)
    opts = opts or {}
    local city = opts.city or "Cyberjaya"
    local coords = opts.coords or {"2.920162986", "101.652997388"}
   --  local date = opts.date or os.date("*t")
    local method = opts.method or 2

   --  local timezone = opts.timezone or 8
   --  local dst = opts.dst or 0
   --  local format = opts.format or "%H:%M"
   --  local times = ptime.get_times(city, coords, date, method, timezone, dst)
   --  local prayer_times = {}
   --  for k, v in pairs(times) do
   --      prayer_times[k] = os.date(format, v)
   --  end
   --  return prayer_times
   local prayTime = require('prayertime.ptime'):new();
   prayTime:setCalcMethod(prayTime.MWL);
   local times = prayTime:getPrayerTimes(os.date("*t"), coords[1], coords[2]);
   print('Fajr' , times[1]);
end

function M.setup(opts)
   opts = opts or {}
   vim.keymap.set("n", "<Leader>h", function()
    if opts.name then
      --  print("hello, " .. opts.name)
      M.get_prayer_times(
         {
            city=opts.city,
            coords=opts.coords,
            method=opts.method,
         }
      )
    else
       print("hello")
    end
 end)

end

return M