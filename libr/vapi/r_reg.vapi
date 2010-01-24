/* radare - LGPL - Copyright 2009-2010 pancake<@nopcode.org> */

[CCode (cheader_filename="r_reg.h", cprefix="r_reg_", lower_case_cprefix="r_reg_")]
[Compact]
[CCode (cname="struct r_reg_t", free_function="r_reg_free", cprefix="r_reg_")]
public class Radare.rRegister {
	[CCode (cprefix="R_REG_TYPE_")]
	public enum Type {
		GPR,
		DRX,
		FPU,
		MMX,
		XMM,
		FLG,
		SEG,
		LAST,
		ALL
	}

	[Compact]
	[CCode (cname="struct r_reg_item_t", destroy_function="", free_function="" )]
	public class Item {
		public string name;
		public int size;
		public int offset;
		public int packed_size;
		public Type type;
	}

	[Compact]
	[CCode (cname="struct r_reg_arena_t", destroy_function="", free_function="" )]
	public class Arena {
		public uint8* bytes;
		public int size;
	}
	
	[Compact]
	[CCode (cname="struct r_reg_set_t", destroy_function="", free_function="" )]
	public class Set {
		public rRegister.Arena arena;
		public rList<rRegister.Arena*> arenas;
		public rList<rRegister.Item*> regs;
	}

	[NoArrayLength]
	[CCode (cname="r_reg_types")]
	public static weak string types[]; //Type.LAST];

	public rRegister();
	public bool set_profile(string file);
	public bool set_profile_string(string profile);
	public rRegister.Item get(string name, int type = -1);
	/* TODO: use r_array or r_list here */
	//public KernelList<rRegister.Item*> get_list(rRegister.Type type);

	public uint64 get_value(rRegister.Item item);
	public bool set_value(rRegister.Item item, uint64 val);

	public float get_fvalue(Item item);
	public bool set_fvalue(Item item, float val);

	public uint64 get_pvalue(Item item, int pidx);
	public bool set_pvalue(Item item, uint64 val, int pidx);

	public uint8* get_bytes(Type type, out int size = null);
	public int set_bytes(Type type, uint8* buf, int len);

	public void fit_arena();
}
