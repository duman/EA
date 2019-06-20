local rangeStart = nil
local rangeFinish = nil

function edit (paramsString, firstValue, ifDowngrade)
  gg.clearResults()
  gg.searchNumber(paramsString, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, rangeStart, rangeFinish)

  if gg.getResultsCount() ~= 0 then
    gg.searchNumber(firstValue, gg.TYPE_DWORD)
    local resultsTable = gg.getResults(200)

    for i,v in ipairs(resultsTable) do

      if rangeStart == nil then
        rangeStart = v['address'] / 10000 * 10000 - 100000
        rangeFinish = rangeStart + 300000
      end

      if i == 2 then
        local mem_address = 0
        local resultsTableLine = {}
        for j = 1, 45, 1 do
          if j == 1 then
            mem_address = v['address'] -- initialize the address within the list
          end

          local currentValue = {}
          currentValue[1] = {}
          currentValue[1].address = mem_address
          currentValue[1].flags = gg.TYPE_DWORD
          local val2 = gg.getValues(currentValue)

          resultsTableLine[j] = {}
          resultsTableLine[j].address = mem_address
          resultsTableLine[j].flags = gg.TYPE_DWORD
          if val2[1].value == 0 then -- if the value is 0 then don't change it
            resultsTableLine[j].value = 0
          elseif val2[1].value < 5 then -- set weak foot to 5 stars
            resultsTableLine[j].value = 5
          elseif val2[1].value >= 130 then -- if the value is bigger then 130 dont change it
            resultsTableLine[j].value = val2[1].value
          else
            if ifDowngrade == nil  then
              resultsTableLine[j].value = 130 -- make all stats go 130 when ifDowngrade variable equals to "nil", used to make any player play like a prime icon
            else
              resultsTableLine[j].value = 1 -- make all stats go to 1 when ifDowngrade variable is not "nil", used in LvL to make defenders useless
            end
          end

          mem_address = mem_address + 4
        end
        gg.setValues(resultsTableLine)
      end
    end
  end
end

-- Naldo CB 89 / RONALDO APARECIDO RODRIGUES / 19502318
edit('67;95;93;71;48;65;104;70::29', 67)

--[[
Stats in order from left to right.
var firstEight = [ 'ACC', 'AGG', 'AWR', 'BAC', 'CRO', 'DRI', 'HEA', 'LPA'];

ACC = Acceleration
AGG = Aggression
AWR = Interceptions
BAC = Ball Control
CRO = Crossing
DRI = Dribbling
HEA = Heading
LPA = Long Pass Accuracy

All lines ends with "::29', ACC)".
]]