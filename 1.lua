-- ============================================================
-- GG 脚本（由 JSON 配置自动生成 · 常驻悬浮窗版）
-- 使用说明：
--   1. 启动后脚本常驻后台，点悬浮球弹出菜单
--   2. 先按各功能描述进入对应场景（如长安城、凤凰秘境）
--   3. 执行任意功能前先校验初始化：未开启或校验失败自动重新初始化
--   4. 「初始化」开启后不可关闭、不可还原
--   5. 其余功能关闭时自动还原修改前的数值
-- ============================================================

local TYPE_MAP = {
  BYTE   = gg.TYPE_BYTE,
  WORD   = gg.TYPE_WORD,
  DWORD  = gg.TYPE_DWORD,
  QWORD  = gg.TYPE_QWORD,
  FLOAT  = gg.TYPE_FLOAT,
  DOUBLE = gg.TYPE_DOUBLE,
  XOR    = gg.TYPE_XOR,
  AUTO   = gg.TYPE_AUTO,
}

local RANGE_MAP = {
  RANGE_C_ALLOC   = gg.REGION_C_ALLOC,
  RANGE_OTHER     = gg.REGION_OTHER,
  RANGE_ANONYMOUS = gg.REGION_ANONYMOUS,
  RANGE_CODE_APP  = gg.REGION_CODE_APP,
  RANGE_STACK     = gg.REGION_STACK,
  RANGE_BAD       = gg.REGION_BAD,
  RANGE_ASHMEM    = gg.REGION_ASHMEM,
  RANGE_VIDEO     = gg.REGION_VIDEO,
}

local LOCKED = "anti_ban"  -- 锁定功能：开启后禁止关闭和还原

-- 功能定义（按菜单顺序排列）
local FEATURES = {
  {
    id = "anti_ban",
    name = "初始化",
    description = "在长安城开启",
    enable_msg = "开启成功！",
    disable_msg = "关闭成功！",
    memory_range = "RANGE_C_ALLOC",
    search = { value = "8423627", type = "DWORD" },
    offsets = {},
    writes = {
      { value = "-2003330816", type = "DWORD", offset = -4 },
      { value = "0", type = "DWORD", offset = -8 },
      { value = "0", type = "DWORD", offset = -12 },
      { value = "0", type = "DWORD", offset = -16 },
      { value = "0", type = "DWORD", offset = -20 },
      { value = "0", type = "DWORD", offset = -24 },
      { value = "0", type = "DWORD", offset = -28 },
      { value = "0", type = "DWORD", offset = -32 },
      { value = "0", type = "DWORD", offset = -36 },
      { value = "0", type = "DWORD", offset = -40 },
      { value = "1", type = "DWORD", offset = -44 },
    },
  },
  {
    id = "top_value",
    name = "顶级数值",
    description = "9178",
    enable_msg = "开启成功！",
    disable_msg = "关闭成功！",
    depends_on = "anti_ban",
    memory_range = "RANGE_C_ALLOC",
    search = { value = "-343597384", type = "DWORD" },
    offsets = {
      { value = "1067366481", type = "DWORD", offset = 4 },
      { value = "-2147483648", type = "DWORD", offset = 12 },
      { value = "-491520", type = "DWORD", offset = 20 },
      { value = "-491520", type = "DWORD", offset = 28 },
      { value = "-491520", type = "DWORD", offset = 36 },
    },
    writes = {
      { value = "917800000", type = "DWORD", offset = 16 },
      { value = "917800000", type = "DWORD", offset = 24 },
      { value = "917800000", type = "DWORD", offset = 32 },
      { value = "8888888", type = "DOUBLE", offset = 72 },
      { value = "8888888", type = "DOUBLE", offset = 80 },
      { value = "100000", type = "DOUBLE", offset = 56 },
      { value = "8888888", type = "DOUBLE", offset = 88 },
    },
  },
  {
    id = "fullscreen_attack",
    name = "全屏攻击",
    description = "全屏攻击",
    enable_msg = "开启成功！",
    disable_msg = "关闭成功！重启游戏生效",
    depends_on = "anti_ban",
    memory_range = "RANGE_C_ALLOC",
    search = { value = "23871", type = "DWORD" },
    offsets = {
      { value = "13633", type = "DWORD", offset = 32 },
      { value = "54", type = "DWORD", offset = 20 },
    },
    writes = {
      { value = "-1138098176", type = "DWORD", offset = 40 },
      { value = "469762047", type = "DWORD", offset = 44 },
      { value = "-68", type = "DWORD", offset = 72 },
      { value = "-68", type = "DWORD", offset = 100 },
      { value = "-17374", type = "DWORD", offset = 128 },
      { value = "3546367", type = "DWORD", offset = 132 },
    },
  },
  {
    id = "freeze_monster",
    name = "定怪",
    description = "定怪",
    enable_msg = "开启成功！",
    disable_msg = "重启游戏生效",
    depends_on = "anti_ban",
    memory_range = "RANGE_OTHER",
    search = { value = "89637", type = "DWORD" },
    offsets = {
      { value = "9635", type = "DWORD", offset = -16 },
      { value = "19636", type = "DWORD", offset = -8 },
    },
    writes = {
      { value = "30000", type = "DWORD", offset = -10 },
      { value = "30000", type = "DWORD", offset = -8 },
      { value = "30000", type = "DWORD", offset = 0 },
      { value = "999999999", type = "DWORD", offset = 24 },
    },
  },
  {
    id = "yellow_bird",
    name = "黄鸟积分",
    description = "进入凤凰秘境后开启",
    enable_msg = "开启成功！",
    disable_msg = "关闭成功！",
    depends_on = "anti_ban",
    memory_range = "RANGE_OTHER",
    search = { value = "-294912", type = "DWORD" },
    offsets = {
      { value = "0", type = "DWORD", offset = 124 },
      { value = "-458752", type = "DWORD", offset = 128 },
      { value = "0", type = "DWORD", offset = -4 },
      { value = "-491520", type = "DWORD", offset = 8 },
      { value = "-491520", type = "DWORD", offset = 16 },
      { value = "-491520", type = "DWORD", offset = 24 },
      { value = "0", type = "DWORD", offset = 68 },
      { value = "0", type = "DWORD", offset = 72 },
      { value = "0", type = "DWORD", offset = 116 },
      { value = "-458752", type = "DWORD", offset = 120 },
    },
    writes = {
      { value = "444", type = "DWORD", offset = 20 },
    },
  },
  {
    id = "pet_time_1",
    name = "宠物秘境延迟",
    description = "修改时间为150",
    enable_msg = "修改时间为150",
    disable_msg = "重启游戏生效！",
    depends_on = "anti_ban",
    memory_range = "RANGE_C_ALLOC",
    search = { value = "-491520", type = "DWORD" },
    offsets = {
      { value = "4.243748739E-314", type = "DOUBLE", offset = -32 },
      { value = "1.294415004057E-312", type = "DOUBLE", offset = -8 },
      { value = "2.121752948E-314", type = "DOUBLE", offset = 24 },
      { value = "1.8010772393448525E-226", type = "DOUBLE", offset = 32 },
      { value = "0.016666666666666666", type = "DOUBLE", offset = 36 },
    },
    writes = {
      { value = "150", type = "DOUBLE", offset = 4 },
    },
  },
  {
    id = "pet_time_2",
    name = "宠物秘境结算",
    description = "修改时间为5",
    enable_msg = "时间·开启成功，共修改4个值",
    disable_msg = "重启游戏生效！",
    depends_on = "anti_ban",
    memory_range = "RANGE_C_ALLOC",
    search = { value = "-491520", type = "DWORD" },
    offsets = {
      { value = "4.243748739E-314", type = "DOUBLE", offset = -32 },
      { value = "1.294415004057E-312", type = "DOUBLE", offset = -8 },
      { value = "2.121752948E-314", type = "DOUBLE", offset = 24 },
      { value = "1.8010772393448525E-226", type = "DOUBLE", offset = 32 },
      { value = "0.016666666666666666", type = "DOUBLE", offset = 36 },
    },
    writes = {
      { value = "5", type = "DOUBLE", offset = 4 },
    },
  },
}

-- ============================================================
-- 工具函数
-- ============================================================

local state = {}        -- 功能开启状态
local savedValues = {}  -- 修改前的原始值（用于还原）
local initCheck = nil   -- 初始化写入的地址与期望值（供校验）
local running = true    -- 主循环控制

local function featureByKey(key)
  for _, f in ipairs(FEATURES) do
    if f.id == key then return f end
  end
  return nil
end

local function sameValue(got, expected, isFloat)
  local a, b = tonumber(got), tonumber(expected)
  if a == nil or b == nil then
    return tostring(got) == tostring(expected)
  end
  if isFloat then
    if b == 0 then return a == 0 end
    return math.abs(a - b) <= math.abs(b) * 1e-6
  end
  return a == b
end

-- 搜索特征值并用 offsets 校验，返回所有匹配的基址
local function findAddresses(f)
  gg.clearResults()
  gg.setRanges(RANGE_MAP[f.memory_range])
  gg.searchNumber(f.search.value, TYPE_MAP[f.search.type], false, gg.SIGN_EQUAL)

  local count = gg.getResultsCount()
  if count == 0 then
    gg.clearResults()
    return nil, "未搜索到特征值\n请确认已在正确场景开启（" .. f.description .. "）"
  end

  local results = gg.getResults(count)
  local matched = {}

  if #f.offsets == 0 then
    for _, r in ipairs(results) do
      matched[#matched + 1] = r.address
    end
  else
    for _, r in ipairs(results) do
      local checks = {}
      for _, o in ipairs(f.offsets) do
        checks[#checks + 1] = {
          address = r.address + o.offset,
          flags = TYPE_MAP[o.type],
        }
      end
      checks = gg.getValues(checks)

      local ok = true
      for i, o in ipairs(f.offsets) do
        local isFloat = (TYPE_MAP[o.type] == gg.TYPE_DOUBLE or TYPE_MAP[o.type] == gg.TYPE_FLOAT)
        if not sameValue(checks[i].value, o.value, isFloat) then
          ok = false
          break
        end
      end
      if ok then
        matched[#matched + 1] = r.address
      end
    end
  end

  gg.clearResults()

  if #matched == 0 then
    return nil, "偏移校验失败，未匹配到目标地址"
  end
  return matched
end

-- ============================================================
-- 开启 / 关闭
-- ============================================================

local function enableFeature(f)
  gg.toast("正在搜索：" .. f.name)
  local addrs, err = findAddresses(f)
  if not addrs then
    gg.alert("【" .. f.name .. "】开启失败\n\n" .. err)
    return false
  end

  local saved, edits = {}, {}
  for _, base in ipairs(addrs) do
    for _, w in ipairs(f.writes) do
      local addr = base + w.offset
      saved[#saved + 1] = { address = addr, flags = TYPE_MAP[w.type] }
      edits[#edits + 1] = {
        address = addr,
        flags = TYPE_MAP[w.type],
        value = w.value,
      }
    end
  end

  saved = gg.getValues(saved)
  savedValues[f.id] = saved
  gg.setValues(edits)

  -- 初始化写入后记录期望值，供后续校验
  if f.id == LOCKED then
    initCheck = edits
  end

  state[f.id] = true
  if #addrs > 1 then
    gg.toast(f.enable_msg .. "\n（匹配到 " .. #addrs .. " 个结果，已全部修改）")
  else
    gg.toast(f.enable_msg)
  end
  return true
end

-- 执行初始化（搜索 + 写入）
local function runInit()
  local init = featureByKey(LOCKED)
  gg.toast("正在执行初始化...")
  return enableFeature(init)
end

-- 校验初始化：未开启则自动执行；已开启则回读内存逐项比对，
-- 任一值不匹配视为失效，自动重新初始化
local function checkInit()
  if not state[LOCKED] or not initCheck then
    return runInit()
  end

  local now = gg.getValues(initCheck)
  for i, e in ipairs(initCheck) do
    local isFloat = (e.flags == gg.TYPE_DOUBLE or e.flags == gg.TYPE_FLOAT)
    if not sameValue(now[i].value, e.value, isFloat) then
      gg.toast("初始化校验失败，重新初始化")
      return runInit()
    end
  end
  return true
end

-- 开启任意功能：先校验初始化，通过后再执行该功能
local function openFeature(f)
  if not checkInit() then
    gg.alert("初始化校验/执行失败，无法开启【" .. f.name .. "】")
    return
  end
  enableFeature(f)
end

local function disableFeature(f)
  if f.id == LOCKED then
    gg.toast("初始化开启后不可关闭")
    return
  end
  if savedValues[f.id] then
    gg.setValues(savedValues[f.id])
    savedValues[f.id] = nil
  end
  state[f.id] = false
  gg.toast(f.disable_msg)
end

local function disableAll()
  -- 按开启顺序的逆序还原；初始化为锁定功能，永不还原
  for i = #FEATURES, 1, -1 do
    local f = FEATURES[i]
    if state[f.id] and f.id ~= LOCKED then
      disableFeature(f)
    end
  end
  gg.toast("已还原全部修改（初始化除外）")
end

-- ============================================================
-- 菜单（弹出一次，选择后返回主循环）
-- 返回 false 表示用户选择退出脚本
-- ============================================================

local function showMenu()
  local items = {}
  for _, f in ipairs(FEATURES) do
    if f.id == LOCKED then
      items[#items + 1] = (state[f.id] and "[开] " or "[关] ")
        .. f.name .. "（锁定，不可关闭）"
    else
      items[#items + 1] = (state[f.id] and "[开] " or "[关] ")
        .. f.name .. "（" .. f.description .. "）"
    end
  end
  items[#items + 1] = "全部还原（初始化除外）"
  items[#items + 1] = "退出脚本"

  local sel = gg.choice(items, nil, "功能菜单（点击切换开关）")
  if not sel then return true end

  if sel == #FEATURES + 1 then
    disableAll()
    return true
  elseif sel == #FEATURES + 2 then
    return false
  end

  local f = FEATURES[sel]
  if state[f.id] then
    disableFeature(f)  -- 初始化在此被拦截，不会关闭
  else
    openFeature(f)
  end
  return true
end

-- ============================================================
-- 主循环（常驻后台，轮询悬浮球）
-- ============================================================

local function main()
  gg.setVisible(false)
  gg.toast("脚本已加载\n点悬浮球打开菜单")

  while running do
    if gg.isVisible(true) then
      gg.setVisible(false)
      if not showMenu() then
        running = false
      end
    end
    gg.sleep(100)
  end

  disableAll()  -- 跳过初始化，其余还原
  gg.toast("脚本已退出")
end

main()
