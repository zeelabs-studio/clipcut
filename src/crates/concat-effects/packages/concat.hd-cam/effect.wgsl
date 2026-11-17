struct Params { amount: f32, sharp: f32 }

fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let a = params.amount / 100.0;
    let k = params.sharp / 100.0;
    var out = c.rgb;
    out = saturation(out, 1.0 + a * 0.1);
    out = contrast(out, 1.0 + a * 0.06);
    out = vibrance(out, a * 0.3);
    let blur = soften(uv, 1.5);
    out = max(out + (out - blur) * k * 0.5, vec3<f32>(0.0));
    return vec4<f32>(out, c.a);
}
