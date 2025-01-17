GameTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
  if not IsAltKeyDown() then
    return
  end

  local _, itemLink = tooltip:GetItem()
  local vendorPrice = select(11, GetItemInfo(itemLink))
  local stackSize = select(8, GetItemInfo(itemLink)) or 1
  local auctionPrice = Auctionator.API.v1.GetAuctionPriceByItemLink("FullStackPrices", itemLink)
  local countString = Auctionator.Utilities.CreateCountString(stackSize or 1)
  if vendorPrice ~= nil then
    tooltip:AddDoubleLine("Stack " ..AUCTIONATOR_L_VENDOR .. countString, WHITE_FONT_COLOR:WrapTextInColorCode(Auctionator.Utilities.CreatePaddedMoneyString(vendorPrice * stackSize)))
  end
  if auctionPrice ~= nil then
    tooltip:AddDoubleLine("Stack " ..AUCTIONATOR_L_AUCTION .. countString, WHITE_FONT_COLOR:WrapTextInColorCode(Auctionator.Utilities.CreatePaddedMoneyString((auctionPrice * stackSize))))
  end
end)
