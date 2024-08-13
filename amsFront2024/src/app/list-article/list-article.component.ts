import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router, RouterModule, RouterOutlet } from '@angular/router';
import { ArticleService } from '../services/article.service';

@Component({
  selector: 'app-list-article',
  standalone: true,
  imports: [CommonModule, RouterOutlet, RouterModule],
  templateUrl: './list-article.component.html',
  styleUrl: './list-article.component.css'
})
export class ListArticleComponent {
  articles: any;
  constructor(private service: ArticleService, private router: Router) { }

  ngOnInit() {
    this.refreshListArticles();
  }

  refreshListArticles() {
    this.service.listArticles().subscribe(
      response => {
        this.articles = response;
      }
    );
  }

  deleteArticle(myObj: any): void {
    console.log("call delete article with")
    this.service.deleteArticle(myObj).subscribe(response => {
      this.refreshListArticles();
    });
  }

  updateArticle(myObj: any) {
    console.log("call update article with")
    this.router.navigate(['updateArticle' + '/' + myObj['id']]);
  }

}


