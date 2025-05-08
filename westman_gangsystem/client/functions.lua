

function DrawText3D(x, y, z, text)
  local onScreen, screenX, screenY = World3dToScreen2d(x, y, z)

  if onScreen then 
      local factor = (string.len(text)) / 380
      SetTextScale(0.36, 0.36)
      SetTextFont(4)
      SetTextColour(255, 255, 255, 215)
      SetTextEntry("STRING")
      SetTextCentre(true)
      AddTextComponentSubstringPlayerName(text)
      SetDrawOrigin(x, y, z, 0) 
      EndTextCommandDisplayText(0.0, -0.10)
      DrawRect(0.0, -0.10+0.0125, 0.020+ factor, 0.03, 0, 0, 0, 80)
      ClearDrawOrigin()
  end
end

