## 模型微调 Fine-tuning

### Llama2
> 项目地址llama-recipes: https://github.com/meta-llama/llama-recipes

![img.png](img/system.png)

1. 申请llama2的使用 https://ai.meta.com/resources/models-and-libraries/llama-downloads/
2. Dataset: Samsum https://huggingface.co/datasets/samsum (这是一个偏向总结类型的数据集)
3. cd /llama-recipes/recipes/finetuning/singlegpu_finetuning.md 可以查看单GPU微调步骤

![img.png](img/code1.png)

![img_1.png](img/code2.png)

```
python llama_finetuning.py  --use_peft --peft_method lora --quantization --model_name /content/llama/models_hf/7B --output_dir /content/llama/PEFT/model
--use_peft: 使用Parameter Efficient Fine-Tuning 变量高效微调方法
--peft_method lora: 微调方法选择为"LORA"
在深度学习领域中，"LORA"通常指的是"Low-Rank Adaptation"，即低秩自适应。
这是一种用于模型微调（fine-tuning）的技术，特别是针对于计算资源有限或者模型尺寸较大的情况下。
LORA通过对模型的参数进行低秩近似（Low-Rank Approximation），从而减少了模型的参数数量和计算复杂度，同时保持了模型的性能。
这种技术在资源受限的环境下，例如移动设备或者嵌入式系统中，可以有效地提升模型的效率和性能。
```
