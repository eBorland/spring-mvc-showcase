import { Component } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Component({
  selector: 'app-root',
  template: (<any>window).mainTemplate,
})
export class AppComponent {
  template: object = {
    elements: []
  };

  constructor (
    private http: Http
  ) {}

  ngOnInit() {
    this.getTemplate();
  }

  getTemplate() {
    this.http.get('./app/assets/template.js')
      .map(this.parseData)
      .catch(this.handleError)
      .subscribe(
        template => this.template = template,
        error => {}
      );
  }

  private parseData(res: Response) {
    return res.json() || {};
  }

  private handleError (error: Response | any) {
    console.log('There has been an error!!', error);
    return Observable.throw(error);
  }
}
