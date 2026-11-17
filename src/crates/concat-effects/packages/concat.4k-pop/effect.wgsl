struct Params { pop: f32, clarity: f32 }

// A firm S-curve and contrast for punch, vibrance so skin stays natural,
// then an unsharp mask for crisp detail.
fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let pop = params.pop / 100.0;
    let clarity = params.clarity / 100.0;
    var out = s_curve(c.rgb, pop * 0.35);
    out = contrast(out, 1.0 + pop * 0.12);
    out = vibrance(out, pop * 0.8);
    let blur = soften(uv, 2.0);
    out = max(out + (out - blur) * clarity * 1.2, vec3<f32>(0.0));
    return vec4<f32>(out, c.a);
}
