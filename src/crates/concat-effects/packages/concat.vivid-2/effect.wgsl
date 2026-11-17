struct Params { amount: f32 }

fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let a = params.amount / 100.0;
    var out = c.rgb;
    out = saturation(out, 1.0 + a * 0.45);
    out = vibrance(out, a * 0.6);
    out = contrast(out, 1.0 + a * 0.08);
    return vec4<f32>(out, c.a);
}
