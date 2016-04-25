use ".."

actor Main
  new create(env: Env) =>
    let ready_string = "google.com"
    let compress_string = Smoozy.compress(ready_string, ready_string.size() * 4)
    env.out.print("Compress: " + compress_string.clone())

    let decompress_string = Smoozy.decompress(compress_string, ready_string.size())
    env.out.print("Decompress: " + decompress_string.clone())
