import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { User } from '../Entity/user.entity';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(private httpClient: HttpClient) { }

  findAll(params: any) {
    return this.httpClient.get('http://localhost:3000/user', {
      params
    });
  }

  findOne(id: string) {
    return this.httpClient.get<User>('http://localhost:3000/user/'+id);
  }

  update(user: User) {
    return this.httpClient.patch<User>('http://localhost:3000/user/'+user._id, user);
  }
}
