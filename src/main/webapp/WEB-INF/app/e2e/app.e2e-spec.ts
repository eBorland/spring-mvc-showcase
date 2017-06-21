import { AppSamplePage } from './app.po';

describe('app-sample App', () => {
  let page: AppSamplePage;

  beforeEach(() => {
    page = new AppSamplePage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
