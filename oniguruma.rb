  ONIGURUMA_VERSION_MAJOR = 5
  ONIGURUMA_VERSION_MINOR = 6
  ONIGURUMA_VERSION_TEENY = 1
  ONIGENC_CASE_FOLD_TURKISH_AZERI = (1 << 20)
  INTERNAL_ONIGENC_CASE_FOLD_MULTI_CHAR = (1 << 30)
  ONIGENC_CASE_FOLD_MIN = (1 << 30)
  ONIGENC_MAX_COMP_CASE_FOLD_CODE_LEN = 3
  ONIGENC_GET_CASE_FOLD_CODES_MAX_NUM = 13
  class OnigCaseFoldCodeItem < FFI::Struct
    layout(
           :byte_len, :int,
           :code_len, :int,
           :code, [:ulong, 3]
    )
  end
  class OnigMetaCharTableType < FFI::Struct
    layout(
           :esc, :ulong,
           :anychar, :ulong,
           :anytime, :ulong,
           :zero_or_one_time, :ulong,
           :one_or_more_time, :ulong,
           :anychar_anytime, :ulong
    )
  end
  Callback_OnigApplyAllCaseFoldFunc = callback(:OnigApplyAllCaseFoldFunc, [ :ulong, :pointer, :int, :pointer ], :int)
  class OnigEncodingTypeST < FFI::Struct
    layout(
           :mbc_enc_len, callback([ :pointer ], :int),
           :name, :pointer,
           :max_enc_len, :int,
           :min_enc_len, :int,
           :is_mbc_newline, callback([ :pointer, :pointer ], :int),
           :mbc_to_code, callback([ :pointer, :pointer ], :ulong),
           :code_to_mbclen, callback([ :ulong ], :int),
           :code_to_mbc, callback([ :ulong, :pointer ], :int),
           :mbc_case_fold, callback([ :uint, :pointer, :pointer, :pointer ], :int),
           :apply_all_case_fold, callback([ :uint, Callback_OnigApplyAllCaseFoldFunc, :pointer ], :int),
           :get_case_fold_codes_by_str, callback([ :uint, :pointer, :pointer, a().OnigCaseFoldCodeItem ], :int),
           :property_name_to_ctype, callback([ :pointer, :pointer, :pointer ], :int),
           :is_code_ctype, callback([ :ulong, :uint ], :int),
           :get_ctype_code_range, callback([ :int, :pointer, a().p.q(const).OnigCodePoint ], :int),
           :left_adjust_char_head, callback([ :pointer, :pointer ], :pointer),
           :is_allowed_reverse_match, callback([ :pointer, :pointer ], :int)
    )
    def mbc_enc_len=(cb)
      @mbc_enc_len = cb
      self[:mbc_enc_len] = @mbc_enc_len
    end
    def mbc_enc_len
      @mbc_enc_len
    end
    def name=(str)
      @name = FFI::MemoryPointer.from_string(str)
      self[:name] = @name
    end
    def name
      @name.get_string(0)
    end
    def is_mbc_newline=(cb)
      @is_mbc_newline = cb
      self[:is_mbc_newline] = @is_mbc_newline
    end
    def is_mbc_newline
      @is_mbc_newline
    end
    def mbc_to_code=(cb)
      @mbc_to_code = cb
      self[:mbc_to_code] = @mbc_to_code
    end
    def mbc_to_code
      @mbc_to_code
    end
    def code_to_mbclen=(cb)
      @code_to_mbclen = cb
      self[:code_to_mbclen] = @code_to_mbclen
    end
    def code_to_mbclen
      @code_to_mbclen
    end
    def code_to_mbc=(cb)
      @code_to_mbc = cb
      self[:code_to_mbc] = @code_to_mbc
    end
    def code_to_mbc
      @code_to_mbc
    end
    def mbc_case_fold=(cb)
      @mbc_case_fold = cb
      self[:mbc_case_fold] = @mbc_case_fold
    end
    def mbc_case_fold
      @mbc_case_fold
    end
    def apply_all_case_fold=(cb)
      @apply_all_case_fold = cb
      self[:apply_all_case_fold] = @apply_all_case_fold
    end
    def apply_all_case_fold
      @apply_all_case_fold
    end
    def get_case_fold_codes_by_str=(cb)
      @get_case_fold_codes_by_str = cb
      self[:get_case_fold_codes_by_str] = @get_case_fold_codes_by_str
    end
    def get_case_fold_codes_by_str
      @get_case_fold_codes_by_str
    end
    def property_name_to_ctype=(cb)
      @property_name_to_ctype = cb
      self[:property_name_to_ctype] = @property_name_to_ctype
    end
    def property_name_to_ctype
      @property_name_to_ctype
    end
    def is_code_ctype=(cb)
      @is_code_ctype = cb
      self[:is_code_ctype] = @is_code_ctype
    end
    def is_code_ctype
      @is_code_ctype
    end
    def get_ctype_code_range=(cb)
      @get_ctype_code_range = cb
      self[:get_ctype_code_range] = @get_ctype_code_range
    end
    def get_ctype_code_range
      @get_ctype_code_range
    end
    def left_adjust_char_head=(cb)
      @left_adjust_char_head = cb
      self[:left_adjust_char_head] = @left_adjust_char_head
    end
    def left_adjust_char_head
      @left_adjust_char_head
    end
    def is_allowed_reverse_match=(cb)
      @is_allowed_reverse_match = cb
      self[:is_allowed_reverse_match] = @is_allowed_reverse_match
    end
    def is_allowed_reverse_match
      @is_allowed_reverse_match
    end

  end
  ONIGENC_CODE_TO_MBC_MAXLEN = 7
  ONIGENC_MBC_CASE_FOLD_MAXLEN = 18
  ONIGENC_CTYPE_NEWLINE = 0
  ONIGENC_CTYPE_ALPHA = 1
  ONIGENC_CTYPE_BLANK = 2
  ONIGENC_CTYPE_CNTRL = 3
  ONIGENC_CTYPE_DIGIT = 4
  ONIGENC_CTYPE_GRAPH = 5
  ONIGENC_CTYPE_LOWER = 6
  ONIGENC_CTYPE_PRINT = 7
  ONIGENC_CTYPE_PUNCT = 8
  ONIGENC_CTYPE_SPACE = 9
  ONIGENC_CTYPE_UPPER = 10
  ONIGENC_CTYPE_XDIGIT = 11
  ONIGENC_CTYPE_WORD = 12
  ONIGENC_CTYPE_ALNUM = 13
  ONIGENC_CTYPE_ASCII = 14
  ONIGENC_MAX_STD_CTYPE = 14
  attach_function :onigenc_step_back, [ :pointer, :pointer, :pointer, :int ], :pointer
  attach_function :onigenc_init, [  ], :int
  attach_function :onigenc_set_default_encoding, [ :pointer ], :int
  attach_function :onigenc_get_default_encoding, [  ], :pointer
  attach_function :onigenc_set_default_caseconv_table, [ :pointer ], :void
  attach_function :onigenc_get_right_adjust_char_head_with_prev, [ :pointer, :pointer, :pointer, :pointer ], :pointer
  attach_function :onigenc_get_prev_char_head, [ :pointer, :pointer, :pointer ], :pointer
  attach_function :onigenc_get_left_adjust_char_head, [ :pointer, :pointer, :pointer ], :pointer
  attach_function :onigenc_get_right_adjust_char_head, [ :pointer, :pointer, :pointer ], :pointer
  attach_function :onigenc_strlen, [ :pointer, :pointer, :pointer ], :int
  attach_function :onigenc_strlen_null, [ :pointer, :pointer ], :int
  attach_function :onigenc_str_bytelen_null, [ :pointer, :pointer ], :int
  ONIG_NREGION = 10
  ONIG_MAX_BACKREF_NUM = 1000
  ONIG_MAX_REPEAT_NUM = 100000
  ONIG_MAX_MULTI_BYTE_RANGES_NUM = 10000
  ONIG_MAX_ERROR_MESSAGE_LEN = 90
  ONIG_OPTION_NONE = 0
  ONIG_OPTION_IGNORECASE = 1
  ONIG_OPTION_EXTEND = (1U << 1)
  ONIG_OPTION_MULTILINE = ((1U << 1) << 1)
  ONIG_OPTION_SINGLELINE = (((1U << 1) << 1) << 1)
  ONIG_OPTION_FIND_LONGEST = ((((1U << 1) << 1) << 1) << 1)
  ONIG_OPTION_FIND_NOT_EMPTY = (((((1U << 1) << 1) << 1) << 1) << 1)
  ONIG_OPTION_NEGATE_SINGLELINE = ((((((1U << 1) << 1) << 1) << 1) << 1) << 1)
  ONIG_OPTION_DONT_CAPTURE_GROUP = (((((((1U << 1) << 1) << 1) << 1) << 1) << 1) << 1)
  ONIG_OPTION_CAPTURE_GROUP = ((((((((1U << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)
  ONIG_OPTION_NOTBOL = (((((((((1U << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)
  ONIG_OPTION_NOTEOL = ((((((((((1U << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)
  ONIG_OPTION_POSIX_REGION = (((((((((((1U << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)
  ONIG_OPTION_MAXBIT = (((((((((((1U << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)
  class OnigSyntaxType < FFI::Struct
    layout(
           :op, :uint,
           :op2, :uint,
           :behavior, :uint,
           :options, :uint,
           :meta_char_table, OnigMetaCharTableType
    )
  end
  ONIG_SYN_OP_VARIABLE_META_CHARACTERS = (1U << 0)
  ONIG_SYN_OP_DOT_ANYCHAR = (1U << 1)
  ONIG_SYN_OP_ASTERISK_ZERO_INF = (1U << 2)
  ONIG_SYN_OP_ESC_ASTERISK_ZERO_INF = (1U << 3)
  ONIG_SYN_OP_PLUS_ONE_INF = (1U << 4)
  ONIG_SYN_OP_ESC_PLUS_ONE_INF = (1U << 5)
  ONIG_SYN_OP_QMARK_ZERO_ONE = (1U << 6)
  ONIG_SYN_OP_ESC_QMARK_ZERO_ONE = (1U << 7)
  ONIG_SYN_OP_BRACE_INTERVAL = (1U << 8)
  ONIG_SYN_OP_ESC_BRACE_INTERVAL = (1U << 9)
  ONIG_SYN_OP_VBAR_ALT = (1U << 10)
  ONIG_SYN_OP_ESC_VBAR_ALT = (1U << 11)
  ONIG_SYN_OP_LPAREN_SUBEXP = (1U << 12)
  ONIG_SYN_OP_ESC_LPAREN_SUBEXP = (1U << 13)
  ONIG_SYN_OP_ESC_AZ_BUF_ANCHOR = (1U << 14)
  ONIG_SYN_OP_ESC_CAPITAL_G_BEGIN_ANCHOR = (1U << 15)
  ONIG_SYN_OP_DECIMAL_BACKREF = (1U << 16)
  ONIG_SYN_OP_BRACKET_CC = (1U << 17)
  ONIG_SYN_OP_ESC_W_WORD = (1U << 18)
  ONIG_SYN_OP_ESC_LTGT_WORD_BEGIN_END = (1U << 19)
  ONIG_SYN_OP_ESC_B_WORD_BOUND = (1U << 20)
  ONIG_SYN_OP_ESC_S_WHITE_SPACE = (1U << 21)
  ONIG_SYN_OP_ESC_D_DIGIT = (1U << 22)
  ONIG_SYN_OP_LINE_ANCHOR = (1U << 23)
  ONIG_SYN_OP_POSIX_BRACKET = (1U << 24)
  ONIG_SYN_OP_QMARK_NON_GREEDY = (1U << 25)
  ONIG_SYN_OP_ESC_CONTROL_CHARS = (1U << 26)
  ONIG_SYN_OP_ESC_C_CONTROL = (1U << 27)
  ONIG_SYN_OP_ESC_OCTAL3 = (1U << 28)
  ONIG_SYN_OP_ESC_X_HEX2 = (1U << 29)
  ONIG_SYN_OP_ESC_X_BRACE_HEX8 = (1U << 30)
  ONIG_SYN_OP2_ESC_CAPITAL_Q_QUOTE = (1U << 0)
  ONIG_SYN_OP2_QMARK_GROUP_EFFECT = (1U << 1)
  ONIG_SYN_OP2_OPTION_PERL = (1U << 2)
  ONIG_SYN_OP2_OPTION_RUBY = (1U << 3)
  ONIG_SYN_OP2_PLUS_POSSESSIVE_REPEAT = (1U << 4)
  ONIG_SYN_OP2_PLUS_POSSESSIVE_INTERVAL = (1U << 5)
  ONIG_SYN_OP2_CCLASS_SET_OP = (1U << 6)
  ONIG_SYN_OP2_QMARK_LT_NAMED_GROUP = (1U << 7)
  ONIG_SYN_OP2_ESC_K_NAMED_BACKREF = (1U << 8)
  ONIG_SYN_OP2_ESC_G_SUBEXP_CALL = (1U << 9)
  ONIG_SYN_OP2_ATMARK_CAPTURE_HISTORY = (1U << 10)
  ONIG_SYN_OP2_ESC_CAPITAL_C_BAR_CONTROL = (1U << 11)
  ONIG_SYN_OP2_ESC_CAPITAL_M_BAR_META = (1U << 12)
  ONIG_SYN_OP2_ESC_V_VTAB = (1U << 13)
  ONIG_SYN_OP2_ESC_U_HEX4 = (1U << 14)
  ONIG_SYN_OP2_ESC_GNU_BUF_ANCHOR = (1U << 15)
  ONIG_SYN_OP2_ESC_P_BRACE_CHAR_PROPERTY = (1U << 16)
  ONIG_SYN_OP2_ESC_P_BRACE_CIRCUMFLEX_NOT = (1U << 17)
  ONIG_SYN_OP2_ESC_H_XDIGIT = (1U << 19)
  ONIG_SYN_OP2_INEFFECTIVE_ESCAPE = (1U << 20)
  ONIG_SYN_CONTEXT_INDEP_ANCHORS = (1U << 31)
  ONIG_SYN_CONTEXT_INDEP_REPEAT_OPS = (1U << 0)
  ONIG_SYN_CONTEXT_INVALID_REPEAT_OPS = (1U << 1)
  ONIG_SYN_ALLOW_UNMATCHED_CLOSE_SUBEXP = (1U << 2)
  ONIG_SYN_ALLOW_INVALID_INTERVAL = (1U << 3)
  ONIG_SYN_ALLOW_INTERVAL_LOW_ABBREV = (1U << 4)
  ONIG_SYN_STRICT_CHECK_BACKREF = (1U << 5)
  ONIG_SYN_DIFFERENT_LEN_ALT_LOOK_BEHIND = (1U << 6)
  ONIG_SYN_CAPTURE_ONLY_NAMED_GROUP = (1U << 7)
  ONIG_SYN_ALLOW_MULTIPLEX_DEFINITION_NAME = (1U << 8)
  ONIG_SYN_FIXED_INTERVAL_IS_GREEDY_ONLY = (1U << 9)
  ONIG_SYN_NOT_NEWLINE_IN_NEGATIVE_CC = (1U << 20)
  ONIG_SYN_BACKSLASH_ESCAPE_IN_CC = (1U << 21)
  ONIG_SYN_ALLOW_EMPTY_RANGE_IN_CC = (1U << 22)
  ONIG_SYN_ALLOW_DOUBLE_RANGE_OP_IN_CC = (1U << 23)
  ONIG_SYN_WARN_CC_OP_NOT_ESCAPED = (1U << 24)
  ONIG_SYN_WARN_REDUNDANT_NESTED_REPEAT = (1U << 25)
  ONIG_META_CHAR_ESCAPE = 0
  ONIG_META_CHAR_ANYCHAR = 1
  ONIG_META_CHAR_ANYTIME = 2
  ONIG_META_CHAR_ZERO_OR_ONE_TIME = 3
  ONIG_META_CHAR_ONE_OR_MORE_TIME = 4
  ONIG_META_CHAR_ANYCHAR_ANYTIME = 5
  ONIG_INEFFECTIVE_META_CHAR = 0
  ONIG_NORMAL = 0
  ONIG_MISMATCH = -1
  ONIG_NO_SUPPORT_CONFIG = -2
  ONIGERR_MEMORY = -5
  ONIGERR_TYPE_BUG = -6
  ONIGERR_PARSER_BUG = -11
  ONIGERR_STACK_BUG = -12
  ONIGERR_UNDEFINED_BYTECODE = -13
  ONIGERR_UNEXPECTED_BYTECODE = -14
  ONIGERR_MATCH_STACK_LIMIT_OVER = -15
  ONIGERR_DEFAULT_ENCODING_IS_NOT_SETTED = -21
  ONIGERR_SPECIFIED_ENCODING_CANT_CONVERT_TO_WIDE_CHAR = -22
  ONIGERR_INVALID_ARGUMENT = -30
  ONIGERR_END_PATTERN_AT_LEFT_BRACE = -100
  ONIGERR_END_PATTERN_AT_LEFT_BRACKET = -101
  ONIGERR_EMPTY_CHAR_CLASS = -102
  ONIGERR_PREMATURE_END_OF_CHAR_CLASS = -103
  ONIGERR_END_PATTERN_AT_ESCAPE = -104
  ONIGERR_END_PATTERN_AT_META = -105
  ONIGERR_END_PATTERN_AT_CONTROL = -106
  ONIGERR_META_CODE_SYNTAX = -108
  ONIGERR_CONTROL_CODE_SYNTAX = -109
  ONIGERR_CHAR_CLASS_VALUE_AT_END_OF_RANGE = -110
  ONIGERR_CHAR_CLASS_VALUE_AT_START_OF_RANGE = -111
  ONIGERR_UNMATCHED_RANGE_SPECIFIER_IN_CHAR_CLASS = -112
  ONIGERR_TARGET_OF_REPEAT_OPERATOR_NOT_SPECIFIED = -113
  ONIGERR_TARGET_OF_REPEAT_OPERATOR_INVALID = -114
  ONIGERR_NESTED_REPEAT_OPERATOR = -115
  ONIGERR_UNMATCHED_CLOSE_PARENTHESIS = -116
  ONIGERR_END_PATTERN_WITH_UNMATCHED_PARENTHESIS = -117
  ONIGERR_END_PATTERN_IN_GROUP = -118
  ONIGERR_UNDEFINED_GROUP_OPTION = -119
  ONIGERR_INVALID_POSIX_BRACKET_TYPE = -121
  ONIGERR_INVALID_LOOK_BEHIND_PATTERN = -122
  ONIGERR_INVALID_REPEAT_RANGE_PATTERN = -123
  ONIGERR_TOO_BIG_NUMBER = -200
  ONIGERR_TOO_BIG_NUMBER_FOR_REPEAT_RANGE = -201
  ONIGERR_UPPER_SMALLER_THAN_LOWER_IN_REPEAT_RANGE = -202
  ONIGERR_EMPTY_RANGE_IN_CHAR_CLASS = -203
  ONIGERR_MISMATCH_CODE_LENGTH_IN_CLASS_RANGE = -204
  ONIGERR_TOO_MANY_MULTI_BYTE_RANGES = -205
  ONIGERR_TOO_SHORT_MULTI_BYTE_STRING = -206
  ONIGERR_TOO_BIG_BACKREF_NUMBER = -207
  ONIGERR_INVALID_BACKREF = -208
  ONIGERR_NUMBERED_BACKREF_OR_CALL_NOT_ALLOWED = -209
  ONIGERR_TOO_LONG_WIDE_CHAR_VALUE = -212
  ONIGERR_EMPTY_GROUP_NAME = -214
  ONIGERR_INVALID_GROUP_NAME = -215
  ONIGERR_INVALID_CHAR_IN_GROUP_NAME = -216
  ONIGERR_UNDEFINED_NAME_REFERENCE = -217
  ONIGERR_UNDEFINED_GROUP_REFERENCE = -218
  ONIGERR_MULTIPLEX_DEFINED_NAME = -219
  ONIGERR_MULTIPLEX_DEFINITION_NAME_CALL = -220
  ONIGERR_NEVER_ENDING_RECURSION = -221
  ONIGERR_GROUP_NUMBER_OVER_FOR_CAPTURE_HISTORY = -222
  ONIGERR_INVALID_CHAR_PROPERTY_NAME = -223
  ONIGERR_INVALID_WIDE_CHAR_VALUE = -400
  ONIGERR_TOO_BIG_WIDE_CHAR_VALUE = -401
  ONIGERR_NOT_SUPPORTED_ENCODING_COMBINATION = -402
  ONIGERR_INVALID_COMBINATION_OF_OPTIONS = -403
  ONIGERR_OVER_THREAD_PASS_LIMIT_COUNT = -1001
  ONIG_MAX_CAPTURE_HISTORY_GROUP = 31
  class OnigCaptureTreeNodeStruct < FFI::Struct
    layout(
           :group, :int,
           :beg, :int,
           :end, :int,
           :allocated, :int,
           :num_childs, :int,
           :childs, :pointer
    )
  end
  class ReRegisters < FFI::Struct
    layout(
           :allocated, :int,
           :num_regs, :int,
           :beg, :pointer,
           :end, :pointer,
           :history_root, :pointer
    )
  end
  ONIG_TRAVERSE_CALLBACK_AT_FIRST = 1
  ONIG_TRAVERSE_CALLBACK_AT_LAST = 2
  ONIG_TRAVERSE_CALLBACK_AT_BOTH = (1|2)
  ONIG_REGION_NOTPOS = -1
  class OnigErrorInfo < FFI::Struct
    layout(
           :enc, :pointer,
           :par, :pointer,
           :par_end, :pointer
    )
  end
  class OnigRepeatRange < FFI::Struct
    layout(
           :lower, :int,
           :upper, :int
    )
  end
  Callback_OnigWarnFunc = callback(:OnigWarnFunc, [ :string ], :void)
  attach_function :onig_null_warn, [ :string ], :void
  ONIG_CHAR_TABLE_SIZE = 256
  ONIG_STATE_NORMAL = 0
  ONIG_STATE_SEARCHING = 1
  ONIG_STATE_COMPILING = -1
  ONIG_STATE_MODIFY = -2
  class RePatternBuffer < FFI::Struct
    layout(
           :p, :pointer,
           :used, :uint,
           :alloc, :uint,
           :state, :int,
           :num_mem, :int,
           :num_repeat, :int,
           :num_null_check, :int,
           :num_comb_exp_check, :int,
           :num_call, :int,
           :capture_history, :uint,
           :bt_mem_start, :uint,
           :bt_mem_end, :uint,
           :stack_pop_level, :int,
           :repeat_range_alloc, :int,
           :repeat_range, :pointer,
           :enc, :pointer,
           :options, :uint,
           :syntax, :pointer,
           :case_fold_flag, :uint,
           :name_table, :pointer,
           :optimize, :int,
           :threshold_len, :int,
           :anchor, :int,
           :anchor_dmin, :uint,
           :anchor_dmax, :uint,
           :sub_anchor, :int,
           :exact, :pointer,
           :exact_end, :pointer,
           :map, [:uchar, 256],
           :int_map, :pointer,
           :int_map_backward, :pointer,
           :dmin, :uint,
           :dmax, :uint,
           :chain, :pointer
    )
  end
  class OnigCompileInfo < FFI::Struct
    layout(
           :num_of_elements, :int,
           :pattern_enc, :pointer,
           :target_enc, :pointer,
           :syntax, :pointer,
           :option, :uint,
           :case_fold_flag, :uint
    )
  end
  attach_function :onig_init, [  ], :int
  attach_function :onig_error_code_to_str, [  ], :int
  attach_function :onig_set_warn_func, [ Callback_OnigWarnFunc ], :void
  attach_function :onig_set_verb_warn_func, [ Callback_OnigWarnFunc ], :void
  attach_function :onig_new, [ :pointer, :pointer, :pointer, :uint, :pointer, :pointer, :pointer ], :int
  attach_function :onig_new_deluxe, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :onig_free, [ :pointer ], :void
  attach_function :onig_recompile, [ :pointer, :pointer, :pointer, :uint, :pointer, :pointer, :pointer ], :int
  attach_function :onig_recompile_deluxe, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :onig_search, [ :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :uint ], :int
  attach_function :onig_match, [ :pointer, :pointer, :pointer, :pointer, :pointer, :uint ], :int
  attach_function :onig_region_new, [], :pointer
  attach_function :onig_region_init, [:pointer], :void
  attach_function :onig_region_free, [:pointer, :int ], :void
  attach_function :onig_region_copy, [:pointer, :pointer ], :void
  attach_function :onig_region_clear, [:pointer], :void
  attach_function :onig_region_resize, [:pointer, :int ], :int
  attach_function :onig_region_set, [ :pointer, :int, :int, :int ], :int
  attach_function :onig_name_to_group_numbers, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :onig_name_to_backref_number, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :onig_foreach_name, [ :pointer, callback([ :pointer, :pointer, :int, :pointer, :pointer, :pointer ], :int), :pointer ], :int
  attach_function :onig_number_of_names, [ :pointer ], :int
  attach_function :onig_number_of_captures, [ :pointer ], :int
  attach_function :onig_number_of_capture_histories, [ :pointer ], :int
  attach_function :onig_get_capture_tree, [ :pointer ], :pointer
  attach_function :onig_capture_tree_traverse, [ :pointer, :int, callback([ :int, :int, :int, :int, :int, :pointer ], :int), :pointer ], :int
  attach_function :onig_noname_group_capture_is_active, [ :pointer ], :int
  attach_function :onig_get_encoding, [ :pointer ], :pointer
  attach_function :onig_get_options, [ :pointer ], :uint
  attach_function :onig_get_case_fold_flag, [ :pointer ], :uint
  attach_function :onig_get_syntax, [ :pointer ], :pointer
  attach_function :onig_set_default_syntax, [ :pointer ], :int
  attach_function :onig_copy_syntax, [ :pointer, :pointer ], :void
  attach_function :onig_get_syntax_op, [ :pointer ], :uint
  attach_function :onig_get_syntax_op2, [ :pointer ], :uint
  attach_function :onig_get_syntax_behavior, [ :pointer ], :uint
  attach_function :onig_get_syntax_options, [ :pointer ], :uint
  attach_function :onig_set_syntax_op, [ :pointer, :uint ], :void
  attach_function :onig_set_syntax_op2, [ :pointer, :uint ], :void
  attach_function :onig_set_syntax_behavior, [ :pointer, :uint ], :void
  attach_function :onig_set_syntax_options, [ :pointer, :uint ], :void
  attach_function :onig_set_meta_char, [ :pointer, :uint, :ulong ], :int
  attach_function :onig_copy_encoding, [ :pointer, :pointer ], :void
  attach_function :onig_get_default_case_fold_flag, [  ], :uint
  attach_function :onig_set_default_case_fold_flag, [ :uint ], :int
  attach_function :onig_get_match_stack_limit_size, [  ], :uint
  attach_function :onig_set_match_stack_limit_size, [ :uint ], :int
  attach_function :onig_end, [  ], :int
  attach_function :onig_version, [  ], :string
  attach_function :onig_copyright, [  ], :string
