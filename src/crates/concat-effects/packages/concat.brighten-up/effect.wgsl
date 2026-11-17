struct Params { amount: f32 }

fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let a = params.amount / 100.0;
    var out = c.rgb;
    out = pow(max(out, vec3<f32>(0.0)), vec3<f32>(1.0 - a * 0.3));
    out = contrast(out, 1.0 + a * 0.05);
    out = vibrance(out, a * 0.2);
    return vec4<f32>(out, c.a);
}
