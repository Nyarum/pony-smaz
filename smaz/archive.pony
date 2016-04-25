use "lib:smaz"

use @smaz_compress[I32](in_string: Pointer[U8] tag, inlen: USize, out_string: Pointer[U8] tag, outlen: USize)
use @smaz_decompress[I32](in_string: Pointer[U8] tag, inlen: USize, out_string: Pointer[U8] tag, outlen: USize)

primitive Smaz
  fun tag _make_buffer(size: USize): String iso^ =>
    recover String.from_cstring(
      @pony_alloc[Pointer[U8]](@pony_ctx[Pointer[None] iso](), size), size
    ) end

  fun compress(in_string: String, len_buffer: USize): String ref =>
    var out = _make_buffer(len_buffer)

    @smaz_compress(in_string.cstring(), in_string.size(), out.cstring(), out.size())

    out

  fun decompress(in_string: String ref, len_buffer: USize): String =>
    var out = _make_buffer(len_buffer)

    @smaz_decompress(in_string.cstring(), in_string.size(), out.cstring(), out.size())

    out
