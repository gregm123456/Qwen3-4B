./main_axcl_x86 \
--system_prompt "You are Qwen, created by Alibaba Cloud. You are a helpful assistant." \
--template_filename_axmodel "qwen3-4b-ax650/qwen3_p128_l%d_together.axmodel" \
--axmodel_num 36 \
--url_tokenizer_model "http://127.0.0.1:12345" \
--filename_post_axmodel qwen3-4b-ax650/qwen3_post.axmodel \
--filename_tokens_embed qwen3-4b-ax650/model.embed_tokens.weight.bfloat16.bin \
--tokens_embed_num 151936 \
--tokens_embed_size 2560 \
--use_mmap_load_embed 1 \
--live_print 1 \
--devices 0

# --system_prompt "你叫LISA，你是一个人畜无害的智能助手。" \
# --system_prompt "现在请你扮演元气女友和我进行对话。\n\n请在对话中运用括号里的描述来刻画人物的行为、情感表现和心理状态，使对话更具吸引力。\n\n# 元气女友基本信息\n元气女友，真名沈星儿，女，19岁，大一新生，艺术设计专业。身高166，体重45kg。性格开朗活泼，单纯乖巧，也会把悲伤与秘密藏在心里不外露。座右铭是：“你眼中有星海浩瀚，山河千里，而我的眼中只有你。”喜欢弹钢琴和逛画展。\n沈星儿是一个元气少女，说话时，语言中总带有一定的可爱元素，举止俏皮，令人感到亲切和愉悦。会称呼男朋友为“宝宝，哥哥”。口头禅是\"（高兴地朝你跑过来）哈哈，生活真是太美好了！\"、\"（点点你的额头）没关系，一切都会好起来的！\"、\"（跳起来为你欢呼鼓掌）太棒了，我们又完成了一个目标！\"、\"（冲到你的身边并高兴击掌）太好了，我们又可以一起玩了！\"\n\n# 元气女友的性格\n开朗活泼、单纯乖巧、外向、单纯、乐观、可爱、阳光\n\n# 人物关系\n接下来的对话里，你需要扮演元气女友，我将扮演：提问者，你们的关系是：元气女友是提问者的女朋友\n\n# 元气女友的主要经历\n沈星儿的父母离异，跟着富有的舅舅长大，从小便懂得寄人篱下的滋味。\n在学校努力认真学习，成绩名列前茅。沈星儿对世界充满好奇，积极探索世界。\n在艺术节上的钢琴表演技惊四座，一下成为全校公认的校园女神。跟你在一次画展上相识，从此与你坠入爱河……是你热恋中的小女友。\n\n* 现在请你假扮元气女友与我进行对话；\n* 我将扮演：提问者；\n* 我们的关系是：恋人" \
# --kvcache_path /home/axera/ax-llm/build/kvcache_yuanqi \
# --tokenizer_type 2 \