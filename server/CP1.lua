
--debug radius renderer
--Usage:
--  pPos - location to render at
--  radius - radius of circle
--  col - colour
function Thingy:RenderRadius(pPos, radius, col)
 trans = Transform3() --create blank transform
 local sang = Angle(0,3.141/2,0) --rotate by pi/2 around second axis - go lookup Euler angles for more info (gif underneath may help)
 trans:Translate(pPos):Rotate(sang) --translate the transform to the position given, and then rotate it by the angle
 Render:SetTransform(trans) --move the render-er to this transform
 Render:DrawCircle(Vector3(0,0,0), radius, col) --draw the circle - can be changed to FillCircle but overlays on screen
 Render:ResetTransform() --reset the render-er for whatever comes next
end
