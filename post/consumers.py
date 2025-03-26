import json
from channels.generic.websocket import AsyncWebsocketConsumer
from .models import Comment
from asgiref.sync import sync_to_async

class PostConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_group_name = "posts"
        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name
        )

        await self.accept()

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.room_group_name,
            self.channel_name
        )

    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        post_id = text_data_json['post_id']
        post = await sync_to_async(Comment.objects.get)(id=post_id)


        await self.send(text_data=json.dumps({
            'post': post.content 
        }))


    async def send_post_update(self, event):
        post = event['post']


        await self.send(text_data=json.dumps({
            'post': post
        }))
