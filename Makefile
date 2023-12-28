DOCKER_IMAGE=ghcr.io/huggingface/text-generation-inference:0.9.1
GPUS=all
PORT_MAPPING=3000:80
DATA_VOLUME=/data:/data
LOG_LEVEL=info
TEXT_GEN_ROUTER=debug
MODEL_ID=OpenAssistant/falcon-7b-sft-top1-696
NUM_SHARD=1

run_falcon:
	docker run -p $(PORT_MAPPING) -v $(DATA_VOLUME) -e LOG_LEVEL=$(LOG_LEVEL) -e text_generation_router=$(TEXT_GEN_ROUTER) $(DOCKER_IMAGE) --model-id $(MODEL_ID) --num-shard $(NUM_SHARD)
