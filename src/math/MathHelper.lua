cc = cc or {}

--Vec3   user define
function cc.V3(p1, p2, p3)
    return {x = p1, y = p2, z = p3}
end

function cc.V3Array(n)    
    local array = {}
    for i=1,n do
        local element = {x = 0, y = 0, z =0}
        table.insert(array, element)
    end

    return array
end

function cc.V3Assign(p1, p2)
    p1.x = p2.x
    p1.x = p2.x
    p1.x = p2.x
end

function cc.V3Add(p1, p2)
    return {x = p1.x + p2.x, y = p1.y + p2.y, z = p1.z + p2.z}
end

function cc.V3Sub(p1, p2)
    return {x = p1.x - p2.x, y = p1.y - p2.y, z = p1.z - p2.z}
end

function cc.V3Mul(p1, p2)
    return {x = p1.x * p2.x, y = p1.y * p2.y, z = p1.z * p2.z}
end

function cc.V3Dot(p1, p2)
    return p1.x * p2.x + p1.y * p2.y + p1.z * p2.z
end

function cc.V3MulEx(p1, p2)
    return {x = p1.x * p2, y = p1.y * p2, z = p1.z * p2}
end

function cc.V3LengthSquared(p)
    return (p.x * p.x + p.y * p.y + p.z * p.z)
end

function cc.V3Length(p)
    return math.sqrt(p.x * p.x + p.y * p.y + p.z * p.z)
end

function cc.V3Normalize(p)
    local n = p.x * p.x + p.y * p.y + p.z * p.z
    if n == 1.0 then return end

    n = math.sqrt(n);
    if n < 2e-37 then return end

    n = 1.0 / n;

    p.x = p.x * n
    p.y = p.y * n
    p.z = p.z * n
end

function cc.Mat4()
    local m = {}
    for i = 1, 16 do
        m[i] = 0
    end  

    return m  
end

function cc.Mat4getUpVector(m)
    return {x = m[5], y = m[6], z = m[7]}
end

function cc.Mat4getDownVector(m)
    return {x = -m[5], y = -m[6], z = -m[7]}
end

function cc.Mat4getLeftVector(m)
    return {x = -m[1], y = -m[2], z = -m[3]}
end

function cc.Mat4getRightVector(m)
    return {x = m[1], y = m[2], z = m[3]}
end

function cc.Mat4getForwardVector(m)
    return {x = -m[9], y = -m[10], z = -m[11]}
end

function cc.Mat4getBackVector(m)
    return {x = m[9], y = m[10], z = m[11]}
end

function cc.Mat4createRotationX(m, angle)
    local c = math.cos(angle)
    local s = math.sin(angle)

    m[6]  = c;
    m[7]  = s;
    m[10]  = -s;
    m[11] = c;
end

function cc.Mat4transformVector(m, p)
    local x = p.x
    local y = p.y
    local z = p.z
    local w = 0.0

    p.x = x * m[1] + y * m[5] + z * m[9] + w * m[13];
    p.y = x * m[2] + y * m[6] + z * m[10] + w * m[14];
    p.z = x * m[3] + y * m[7] + z * m[11] + w * m[15];
end