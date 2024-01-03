local M = {}

local popup = require "plenary.popup"

local Win_id

function CloseMenu()
   vim.api.nvim_win_close(Win_id, true)
 end

function ShowMenu(opts, cb)
  local height = 20
  local width = 30
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

  Win_id = popup.create(opts, {
        title = "Prayer Times",
        highlight = "Prayer Times for Cyberjaya",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
        callback = cb,
  })
  local bufnr = vim.api.nvim_win_get_buf(Win_id)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent=false })
end

function MyMenu()
   local opts = {
      "Fajir: 05:45",
      "Sunrise: 07:10",
      "Dhuhr: 13:00",
      "Asr: 16:30",
      "Maghrib: 19:15",
      "Isha: 20:30",
      "Midnight: 00:00",
   }
   local cb = function(_, sel)
     print("it works")
   end
   ShowMenu(opts, cb)
 end

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
   -- print('Fajr' , times[1]);
   MyMenu()
end

function M.setup(opts)
   opts = opts or {}
   vim.keymap.set("n", "<Leader>h", function()
    if opts.city then
      M.get_prayer_times(
         {
            city=opts.city,
            coords=opts.coords,
            method=opts.method,
         }
      )
    else
       print("Please set cityname and coordinates")
    end
 end)

end

return M