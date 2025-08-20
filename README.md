---
license: apache-2.0
language:
- en
base_model:
- Qwen/Qwen3-4B
pipeline_tag: text-generation
tags:
- Qwen
- Qwen3
- Int8
---


# Qwen3-4B-Int8

This version of Qwen3-4B-Int8 has been converted to run on the Axera NPU using **w8a16** quantization.

This model has been optimized with the following LoRA: 

Compatible with Pulsar2 version: 4.2(Not released yet)

## Convert tools links:

For those who are interested in model conversion, you can try to export axmodel through the original repo :
https://huggingface.co/Qwen/Qwen3-4B

[Pulsar2 Link, How to Convert LLM from Huggingface to axmodel](https://pulsar2-docs.readthedocs.io/en/latest/appendix/build_llm.html) 

[AXera NPU LLM Runtime](https://github.com/AXERA-TECH/ax-llm) 


## Support Platform

- AX650
  - [M4N-Dock(爱芯派Pro)](https://wiki.sipeed.com/hardware/zh/maixIV/m4ndock/m4ndock.html)
  - [M.2 Accelerator card](https://axcl-docs.readthedocs.io/zh-cn/latest/doc_guide_hardware.html)
 
|Chips|w8a16|w4a16|
|--|--|--|
|AX650| 4.5 tokens/sec|TBD|

## How to use

Download all files from this repository to the device

```
root@ax650:/mnt/qtang/llm-test/qwen3-4b# tree -L 1
.
|-- config.json
|-- main_ax650
|-- main_axcl_aarch64
|-- main_axcl_x86
|-- post_config.json
|-- qwen2.5_tokenizer
|-- qwen3-4b-ax650
|-- qwen3_tokenizer
|-- qwen3_tokenizer_uid.py
|-- run_qwen3_4b_int8_ctx_ax650.sh
|-- run_qwen3_4b_int8_ctx_axcl_aarch64.sh
`-- run_qwen3_4b_int8_ctx_axcl_x86.sh

3 directories, 9 files
root@ax650:/mnt/qtang/llm-test/qwen3-4b#

```

#### Start the Tokenizer service

Install requirement

```
pip install transformers jinja2
```

```
root@ax650:/mnt/qtang/llm-test/qwen3-4b# python3 qwen3_tokenizer_uid.py
None of PyTorch, TensorFlow >= 2.0, or Flax have been found. Models won't be available and only tokenizers, configuration and file/data utilities can be used.
Server running at http://0.0.0.0:12345
```

#### Inference with AX650 Host, such as M4N-Dock(爱芯派Pro) or AX650N DEMO Board

Open another terminal and run `run_qwen3_4b_int8_ctx_ax650.sh`

```
root@ax650:/mnt/qtang/llm-test/qwen3-4b# ./run_qwen3_4b_int8_ctx_ax650.sh
[I][                            Init][ 110]: LLM init start
[I][                            Init][  34]: connect http://127.0.0.1:12345 ok
[I][                            Init][  57]: uid: 6e90ff82-b9c9-42dc-8f61-081203389166
bos_id: -1, eos_id: 151645
  2% | █                                 |   1 /  39 [3.95s<153.89s, 0.25 count/s] tokenizer init ok
[I][                            Init][  26]: LLaMaEmbedSelector use mmap
100% | ████████████████████████████████ |  39 /  39 [48.03s<48.03s, 0.81 count/s] init post axmodel ok,remain_cmm(5621 MB)
[I][                            Init][ 188]: max_token_len : 2559
[I][                            Init][ 193]: kv_cache_size : 1024, kv_cache_num: 2559
[I][                            Init][ 201]: prefill_token_num : 128
[I][                            Init][ 205]: grp: 1, prefill_max_token_num : 1
[I][                            Init][ 205]: grp: 2, prefill_max_token_num : 256
[I][                            Init][ 205]: grp: 3, prefill_max_token_num : 512
[I][                            Init][ 205]: grp: 4, prefill_max_token_num : 1024
[I][                            Init][ 205]: grp: 5, prefill_max_token_num : 1536
[I][                            Init][ 205]: grp: 6, prefill_max_token_num : 2048
[I][                            Init][ 209]: prefill_max_token_num : 2048
[I][                     load_config][ 282]: load config:
{
    "enable_repetition_penalty": false,
    "enable_temperature": false,
    "enable_top_k_sampling": true,
    "enable_top_p_sampling": false,
    "penalty_window": 20,
    "repetition_penalty": 1.2,
    "temperature": 0.9,
    "top_k": 1,
    "top_p": 0.8
}

[I][                            Init][ 218]: LLM init ok
Type "q" to exit, Ctrl+c to stop current running
[I][          GenerateKVCachePrefill][ 270]: input token num : 21, prefill_split_num : 1 prefill_grpid : 2
[I][          GenerateKVCachePrefill][ 307]: input_num_token:21
[I][                            main][ 230]: precompute_len: 21
[I][                            main][ 231]: system_prompt: You are Qwen, created by Alibaba Cloud. You are a helpful assistant.
prompt >> 1+3=?
[I][                      SetKVCache][ 530]: prefill_grpid:2 kv_cache_num:256 precompute_len:21 input_num_token:16
[I][                      SetKVCache][ 533]: current prefill_max_token_num:1920
[I][                             Run][ 659]: input token num : 16, prefill_split_num : 1
[I][                             Run][ 685]: input_num_token:16
[I][                             Run][ 808]: ttft: 1169.05 ms
<think>

</think>

1 + 3 = 4

[N][                             Run][ 922]: hit eos,avg 4.22 token/s

[I][                      GetKVCache][ 499]: precompute_len:48, remaining:2000
prompt >> who are you?
[I][                      SetKVCache][ 530]: prefill_grpid:2 kv_cache_num:256 precompute_len:48 input_num_token:16
[I][                      SetKVCache][ 533]: current prefill_max_token_num:1920
[I][                             Run][ 659]: input token num : 16, prefill_split_num : 1
[I][                             Run][ 685]: input_num_token:16
[I][                             Run][ 808]: ttft: 1168.56 ms
<think>

</think>

I am Qwen, a large-scale language model developed by Alibaba Cloud. I can answer questions, create content,
and help with a variety of tasks. How can I assist you today?

[N][                             Run][ 922]: hit eos,avg 4.22 token/s

[I][                      GetKVCache][ 499]: precompute_len:106, remaining:1942
prompt >> q
root@ax650:/mnt/qtang/llm-test/qwen3-4b#
```

#### Inference with M.2 Accelerator card

[What is M.2 Accelerator card?](https://axcl-docs.readthedocs.io/zh-cn/latest/doc_guide_hardware.html), Show this DEMO based on Raspberry PI 5.

```
(base) axera@raspberrypi:~/samples/qwen3-4b $ ./run_qwen3_4b_int8_ctx_axcl_aarch64.sh
[I][                            Init][ 136]: LLM init start
[I][                            Init][  34]: connect http://127.0.0.1:12345 ok
[I][                            Init][  57]: uid: a5b1e427-0cdf-4da6-b3a7-f5e0517da0bb
bos_id: -1, eos_id: 151645
  2% | █                                 |   1 /  39 [0.99s<38.45s, 1.01 count/s] tokenizer init ok
[I][                            Init][  45]: LLaMaEmbedSelector use mmap
  5% | ██                                |   2 /  39 [0.99s<19.23s, 2.03 count/s] embed_selector init ok
[I][                             run][  30]: AXCLWorker start with devid 0
100% | ████████████████████████████████ |  39 /  39 [133.16s<133.16s, 0.29 count/s] init post axmodel ok,remain_cmm(691 MB)(1096 MB)000000000
[I][                            Init][ 237]: max_token_len : 2559
[I][                            Init][ 240]: kv_cache_size : 1024, kv_cache_num: 2559
[I][                            Init][ 248]: prefill_token_num : 128
[I][                            Init][ 252]: grp: 1, prefill_max_token_num : 1
[I][                            Init][ 252]: grp: 2, prefill_max_token_num : 256
[I][                            Init][ 252]: grp: 3, prefill_max_token_num : 512
[I][                            Init][ 252]: grp: 4, prefill_max_token_num : 1024
[I][                            Init][ 252]: grp: 5, prefill_max_token_num : 1536
[I][                            Init][ 252]: grp: 6, prefill_max_token_num : 2048
[I][                            Init][ 256]: prefill_max_token_num : 2048
________________________
|    ID| remain cmm(MB)|
========================
|     0|            691|
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
[I][                     load_config][ 282]: load config:
{
    "enable_repetition_penalty": false,
    "enable_temperature": false,
    "enable_top_k_sampling": true,
    "enable_top_p_sampling": false,
    "penalty_window": 20,
    "repetition_penalty": 1.2,
    "temperature": 0.9,
    "top_k": 1,
    "top_p": 0.8
}

[I][                            Init][ 279]: LLM init ok
Type "q" to exit, Ctrl+c to stop current running
[I][          GenerateKVCachePrefill][ 335]: input token num : 21, prefill_split_num : 1 prefill_grpid : 2
[I][          GenerateKVCachePrefill][ 372]: input_num_token:21
[I][                            main][ 236]: precompute_len: 21
[I][                            main][ 237]: system_prompt: You are Qwen, created by Alibaba Cloud. You are a helpful assistant.
prompt >> who are you
[I][                      SetKVCache][ 628]: prefill_grpid:2 kv_cache_num:256 precompute_len:21 input_num_token:27
[I][                      SetKVCache][ 631]: current prefill_max_token_num:1920
[I][                             Run][ 869]: input token num : 27, prefill_split_num : 1
[I][                             Run][ 901]: input_num_token:27
[I][                             Run][1030]: ttft: 1339.01 ms
<think>

</think>

I am Qwen, a large-scale language model developed by Alibaba Cloud. I can answer questions,
create content, and help with a variety of tasks. What can I assist you with?

[N][                             Run][1182]: hit eos,avg 3.65 token/s

[I][                      GetKVCache][ 597]: precompute_len:90, remaining:1958
prompt >> q
[I][                             run][  80]: AXCLWorker exit with devid 0
(base) axera@raspberrypi:~/samples/qwen3-4b $
(base) axera@raspberrypi:~ $ axcl-smi
+------------------------------------------------------------------------------------------------+
| AXCL-SMI  V3.4.0_20250423020139                                  Driver  V3.4.0_20250423020139 |
+-----------------------------------------+--------------+---------------------------------------+
| Card  Name                     Firmware | Bus-Id       |                          Memory-Usage |
| Fan   Temp                Pwr:Usage/Cap | CPU      NPU |                             CMM-Usage |
|=========================================+==============+=======================================|
|    0  AX650N                     V3.4.0 | 0000:01:00.0 |                193 MiB /      945 MiB |
|   --   37C                      -- / -- | 2%        0% |               6348 MiB /     7040 MiB |
+-----------------------------------------+--------------+---------------------------------------+

+------------------------------------------------------------------------------------------------+
| Processes:                                                                                     |
| Card      PID  Process Name                                                   NPU Memory Usage |
|================================================================================================|
|    0    84643  /home/axera/samples/qwen3-4b/main_axcl_aarch64                      4894032 KiB |
+------------------------------------------------------------------------------------------------+
(base) axera@raspberrypi:~ $
```