import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { EstatusModel } from '../models/estatus.model';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})

export class EstatusService {
    private apiURL = 'http://localhost:3000/estatus';

    constructor(private http: HttpClient) {}

    //Obtener todos los estatus
    getAllEstatus(): Observable<EstatusModel[]> {
        return this.http.get<EstatusModel[]>(this.apiURL)
    }
}
