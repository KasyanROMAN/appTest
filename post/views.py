from django.core.paginator import Paginator
from django.shortcuts import render, redirect
from .models import Comment
from .forms import CommentForm
from .tasks import process_new_comment

def index(request):
    posts = Comment.objects.filter(parent__isnull=True).order_by('-created_at')
    paginator = Paginator(posts, 25)  
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'index.html', {'page_obj': page_obj})


def add_comment(request, parent_id=None):
    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            if parent_id:
                post.parent = Comment.objects.get(id=parent_id)
            post.save()

            process_new_comment.delay(post.id)

            return redirect('index')
    else:
        form = CommentForm()

    return render(request, 'add_comment.html', {'form': form})
