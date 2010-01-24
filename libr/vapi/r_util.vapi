/* radare - LGPL - Copyright 2009 pancake<@nopcode.org> */

namespace Radare {
	[Compact]
	[CCode (cheader_filename="r_util.h", cprefix="r_util_")]
	public static class rUtil {
		//public static int hex_str2bin (string input, uint8 *buf);
		//public static int hex_bin2str (uint8 *buf, int len, out string str);
		//public static string hex_bin2strdup (uint8 *buf, int len);
		/* mem */
		//public static uint8 *mem_mem (uint8 *a, int al, uint8 *b, int bl);
		//public static void mem_copyendian (uint8 *dest, uint8 *orig, int size, int endian);
		//public static void mem_copyloop (uint8 *dest, uint8 *orig, int dsize, int osize);
		//public static void mem_cmp_mask (uint8 *dest, uint8 *orig, uint8 *mask, int len);
		/* num */
		//public static uint64 num_get(void *num, string str); // XXX void *
		//public static int offsetof(void *type, void *member);
	}

	// ???
	[CCode (cheader_filename="r_util.h", cprefix="r_str_")]
	public static class rStr {
		public rStr();
		public int hash(string str);
	}

	[CCode (cheader_filename="r_util.h", cprefix="r_num_")]
	public static class rNum {
		public rNum(rNumCallback cb, void *user);
		public uint64 get(string str);
		public uint64 math(string str);
	}
	public delegate uint64 rNumCallback (rNum num, string str, int *ok);

	[CCode (cheader_filename="r_util.h", cprefix="r_log_")]
	public static class rLog {
		public bool msg(string str);
		public bool err(string str);
	}

	[CCode (cheader_filename="r_util.h", cprefix="r_buf_")]
	public class rBuffer {
		public rBuffer();
		public int read_at(uint64 addr, uint8 *buf, int len);
		public int write_at(uint64 addr, uint8 *buf, int len);
		public bool set_bytes(uint8 *buf, int len);
		//public bool memcpy(uint64 addr, uint8 *dst, uint8 *src, int len);
		/* ... */
	}

	/* Generic Iterator interfaced with r_iter */
#if 0
// XXX not yet supported by valaswig ://
        [Compact]
	[CCode (cheader_filename="r_array.h", cprefix="r_array_", cname="void*")]
        public class rArray<G> {
                public rArray (int size);
                public unowned G cur ();
                public bool next ();
                public void rewind ();
		public unowned G get ();
                public unowned rArray<G> get_n (int idx);
                public unowned G prev ();
                public void delete ();
                public unowned G first ();
		public void @foreach (rArrayCallback cb);
                public unowned G free ();
                public void set (int idx, owned G data);
		public rArray<G> iterator ();
		/* defining the callback here results in signature of:
			static gint __lambda1__void*r_iter_callback (IterableObject* foo, gpointer self) {
			                           ^---- wtf!
			iter.vala:55.23-55.28: error: The name `name' does not exist in the context of `G'
			public delegate int rIterCallback (G foo);
		*/
        }
	/* TODO: move this declaration inside rIter to have access to the Generic type */
	public delegate int rArrayCallback (void *foo);
#endif

#if 0
	/* TODO: to be removed. not fully compliant */
	[Compact]
	[CCode (cprefix="ralist_", cheader_filename="r_types.h,list.h", cname="struct list_head")]
	public class KernelList<G> {
		public KernelList ();
		[CCode (cname="ralist_next")]
		public bool next();
		[CCode (cname="ralist_append")]
		public void append(owned G foo);
		[CCode (cname="")]
		public G @free(G arg);
		[CCode (cname="ralist_get", generic_type_pos=2)]
		public unowned G get();
		[CCode (cname="ralist_iterator")]
		public KernelList<G> iterator();
	}
#endif

	[Compact]
	[CCode (cprefix="r_list_", cheader_filename="r_util.h", cname="struct r_list_t")]
	public class rList<G> {
		public rList ();
		public void append(owned G foo);
		public void prepend(owned G foo);
		//public unowned G get();
		//public rListIter<G> iterator();
	}

	[Compact]
	[CCode (cprefix="r_list_iter_", cheader_filename="r_list.h", cname="struct r_list_iter_t")]
	public class rListIter<G> {
		public bool next();
	//	public G @free(G arg);
		public unowned G get();
	}

	/* TODO: deprecated by r_iter ??? */
/*
	[Compact]
	[CCode (cprefix="rarray_", cheader_filename="r_types.h", cname="void")]
	public static class rArray<G> {
		[CCode (cname="rarray_next", generic_type_pos=2)]
		public bool next(); //int type=0);
		[CCode (cname="")]
		public G @free(G arg);
		[CCode (cname="rarray_get", generic_type_pos=2)]
		public unowned G get(); //int type=0);
		[CCode (cname="rarray_iterator")] //, generic_type_pos=2)]
		public rArray<G> iterator();
	}
*/
}
