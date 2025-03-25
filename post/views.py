from django.core.paginator import Paginator
from django.shortcuts import render, redirect
from .models import Post
from .forms import PostForm
from .tasks import process_new_post

def index(request):
    posts = Post.objects.filter(parent__isnull=True).order_by('-created_at')
    paginator = Paginator(posts, 25)  
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'index.html', {'page_obj': page_obj})


def add_post(request, parent_id=None):
    if request.method == 'POST':
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            if parent_id:
                post.parent = Post.objects.get(id=parent_id)
            post.save()

            process_new_post.delay(post.id)

            return redirect('index')
    else:
        form = PostForm()

    return render(request, 'add_post.html', {'form': form})
