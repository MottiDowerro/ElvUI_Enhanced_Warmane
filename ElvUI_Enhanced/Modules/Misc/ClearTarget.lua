local E, L, V, P, G = unpack(ElvUI)
local MOD = E:NewModule("Enhanced_ClearTarget")

function MOD:UpdateBinding()
	local key = E.db.enhanced.general.clearTarget.enable and E.db.enhanced.general.clearTarget.key or ""
	
	-- Get current keys bound to our action
	local oldKey = GetBindingKey("CLICK EE_ClearTargetButton:LeftButton")
	
	-- If the binding is already correct, do nothing
	if key == (oldKey or "") then return end
	
	-- Unbind the old key if one exists
	if oldKey then
		SetBinding(oldKey, nil)
	end
	
	-- Bind the new key if one is set
	if key ~= "" then
		SetBinding(key, "CLICK EE_ClearTargetButton:LeftButton")
	end
	
	SaveBindings(GetCurrentBindingSet())
end

function MOD:Initialize()
	-- Create a secure button to handle /cleartarget
	if not _G.EE_ClearTargetButton then
		local btn = CreateFrame("Button", "EE_ClearTargetButton", UIParent, "SecureActionButtonTemplate")
		btn:RegisterForClicks("AnyDown")
		btn:SetAttribute("type", "macro")
		btn:SetAttribute("macrotext", "/cleartarget")
	end

	MOD:UpdateBinding()
end

E:RegisterModule(MOD:GetName())
